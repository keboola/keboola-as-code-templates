# Import necessary libraries for data quality check script.
# Added explanatory comments for each import.

from openai import OpenAI  # For interacting with OpenAI API
from pathlib import Path   # For file path operations
import json                # For handling JSON data

# Import pandas for data manipulation and analysis.
# If pandas is not installed, inform the user.
try:
    import pandas as pd
except ImportError:
    raise ImportError("pandas is not installed. Please install it with 'pip install pandas'.")

# Import datetime for working with date and time.
from datetime import datetime

# Import numpy for numerical operations.
# If numpy is not installed, inform the user.
try:
    import numpy as np
except ImportError:
    raise ImportError("numpy is not installed. Please install it with 'pip install numpy'.")
import sklearn as sk

# Initialize OpenAI client with API key.
client = OpenAI(api_key={{openai-api-key}})

# Load input table as DataFrame directly - this will be used throughout the script
input_table = pd.read_csv("in/tables/" + {{table-name}} + ".csv")

# For AI analysis, convert DataFrame to string representation
input_table_string = input_table.to_string()


def generate_table_metadata(input_table_string, model="gpt-4"):
    """
    Generate metadata for a given input table using OpenAI's GPT API.

    Parameters:
        input_table_string (str): The input table as a string representation.
        model (str): The model to use for generating the response. Default is 'gpt-4'.

    Returns:
        dict: A dictionary containing column metadata with keys 'column_name', 'data_type', and 'description'.
    """
    # input_table_string is already a string, no conversion needed

    # Create the prompt
    messages = [
        {"role": "system", "content": "Help me with data analysis"},
        {
            "role": "user",
            "content": f"""
            You have data in input_table_string:
            {input_table_string}

            Write me the name of columns in input_table, what data type are values, and a short description of the values.
            If a column contains  numbers or numbers and empty strings or no values then it has type Numeric.
            If a column contains a mix of numbers and strings then it has type Mixed.
            If a column contains strings that looks like date or strings that looks like date and empty strings or no values then it has type Date.
            Please provide the response in JSON format as an array of documents. Include 'column_name', 'data_type', and 'description' for each column.
            Return just the output, without any additional explanation.
            """
        }
    ]

    # API call
    try:
        response = client.chat.completions.create(
            model=model,
            messages=messages
        )
        # Extract the content
        return response.choices[0].message.content   
    except Exception as e:
        print(f"Error during API call: {e}")
        return None

# Get AI response or fallback metadata if AI fails
output = generate_table_metadata(input_table_string) or json.dumps([{"column_name": col, "data_type": "Numeric" if input_table[col].dtype in ['int64', 'float64'] else "Date" if pd.to_datetime(input_table[col].dropna().head(5), errors='coerce').notna().any() else "Mixed" if any(str(v).replace('.','',1).isdigit() for v in input_table[col].dropna().head(10)) else "String", "description": f"Column {col}"} for col in input_table.columns])

# Parse JSON output from AI chat into DataFrame
output_json = json.loads(output)
df_metadata = pd.DataFrame(output_json) 

#table with result of test
test_results = pd.DataFrame(columns=["test_name", "test_column", "data_type", "test_result", "test_date", "test_severity"])


all_column_names = df_metadata['column_name'].tolist()
total_rows = len(input_table)
mixed_columns_names = df_metadata.loc[df_metadata["data_type"].str.contains("Mixed", case=False), "column_name"].tolist()
numeric_columns_names = df_metadata.loc[df_metadata["data_type"].str.contains("Numeric", case=False) | df_metadata["data_type"].str.contains("Float", case=False), "column_name"].tolist()
date_columns_names = df_metadata.loc[df_metadata["data_type"].str.contains("Date", case=False), "column_name"].tolist()

# create dictionary with column_name and data type from response of chat
# Initialize an empty dictionary
column_types = {}
# Loop through each row in the DataFrame
for index, row in df_metadata.iterrows():
    column_name = row['column_name']  # Access column_name
    data_type = row['data_type']      # Access data_type
    column_types[column_name] = data_type

print(date_columns_names)

##test that check mumeric and string value in column in numeric with numeric or mixed data type
#find values with data_type mixed
def check_all_values_are_numeric(test_results, column_names, severity):
    for column_name in column_names:
        data_analysis = {'number':0, 'string':0} 
        if column_name in input_table:
            column_data = input_table[column_name]
            for value in column_data:
                if isinstance(value, int) | isinstance(value, np.float64) | isinstance(value, float):
                    value = str(value) #dataframe nekdy vracel cislo jako string a nekdy jako cislo, tak pretypovavane na string vsecho
                if value.replace('.','',1).isdigit():
                    data_analysis['number'] = data_analysis['number'] + 1
                  
                
                else:
                    if  value == "nan": #pokud je ve prázdná hodnota, tak ji u numerického sloupce považuji za číslo  
                        data_analysis['number'] = data_analysis['number'] + 1
                    else:
                        data_analysis['string'] = data_analysis['string'] + 1
                        
            if data_analysis['string'] == 0:
                test_severity = 'Pass'
            else: 
                test_severity = severity
            test_results = pd.concat([test_results,pd.DataFrame({
                "test_name": "Numeric or String",
                "test_column": column_name,
                "data_type": column_types[column_name],
                "test_result": f"Number: {data_analysis['number']}, String: {data_analysis['string']}",
                "test_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                "test_severity": test_severity 
            },index=[0])])
    return test_results


test_results = check_all_values_are_numeric(test_results,mixed_columns_names, "Warning")

test_results = check_all_values_are_numeric(test_results, numeric_columns_names, "Error")

#test null values in columns
#check_misising_values

def check_missing_values(test_results, column_names):
    for column_name in column_names:
        if column_name in input_table.columns: #check if column exists in input_table  
            # Calculate the number of None or NaN values, count also empty string
            null_count = input_table[column_name].isna().sum() + (input_table[column_name] == "").sum()
            null_share = (null_count / total_rows) * 100 if total_rows > 0 else 0

            #set business rule for values
            if null_share > 15:
                test_severity = "Error"
            elif null_share > 5:
                test_severity = "Warning"
            else:
                test_severity = "Pass"

    #append results for this column
            test_results = pd.concat([test_results, pd.DataFrame({
                    "test_name": "Missing values",
                    "test_column": column_name,
                    "data_type": column_types[column_name],
                    "test_result": f"Count: { null_count}, Share: {null_share:.2f} %",
                    "test_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "test_severity": test_severity
                },index=[0])])
        
    return test_results
    

test_results = check_missing_values(test_results, all_column_names)

#test duplicity rows in input table, values in all column are duplicate
def check_duplicity_rows(test_results):
    duplicity_rows_df = input_table.duplicated()
    true_duplicity_rows_count = len(duplicity_rows_df[duplicity_rows_df == True]) #duplicity row has value true
    false_duplicity_rows_count = len(duplicity_rows_df[duplicity_rows_df == False])


    #set business rule for values
    if true_duplicity_rows_count > 0:
        test_severity = "Error"
    else:
        test_severity = "Pass"

    test_results = pd.concat([test_results, pd.DataFrame({
                        "test_name": "Duplicity Rows",
                        "test_column": 'all_columns',
                        "data_type": "NaN",
                        "test_result": f"Duplicity rows: { true_duplicity_rows_count}, Unique rows: {false_duplicity_rows_count}",
                        "test_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                        "test_severity": test_severity
                    },index=[0])])
    return test_results

test_results = check_duplicity_rows(test_results)

#test of min, max, avg, mean values of numeric column
def statistic_values(test_results, column_names):
    for column_name in column_names:
        if column_name in input_table:
            column_data = input_table[column_name]
            min_value_column_data = column_data.min()
            max_value_column_data = column_data.max()
            mean_value_column_data = column_data.mean() #the average value
            median_value_column_data = column_data.median() #the mid point value
            

            test_results = pd.concat([test_results,pd.DataFrame({
                        "test_name": "Statistic values",
                        "test_column": column_name,
                        "data_type": column_types[column_name],
                        "test_result": f"Min: {min_value_column_data}, Max: {max_value_column_data}, Mean:{mean_value_column_data:.2f}, Median:{median_value_column_data:.2f}",
                        "test_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                        "test_severity": "No warning" 
                    },index=[0])])

    return test_results
test_results = statistic_values(test_results, numeric_columns_names)

#test of quality of dates of date column
def is_valid_date(test_results, column_names):
    for column_name in column_names:
        if column_name in input_table:
            # Validate date format
          # Vytvořit kopii pro testování
          temp_df = input_table.copy()
          temp_df["valid_date"] = pd.to_datetime(temp_df[column_name], errors="coerce")
          temp_df["is_valid_date"] = ~temp_df["valid_date"].isna()

          # Identify invalid dates
          valid_count = temp_df["is_valid_date"].sum()
          invalid_count = total_rows - valid_count

          # List invalid rows
          invalid_rows = temp_df[~temp_df["is_valid_date"]]
          print(temp_df["valid_date"])


          #set business rule for values
          if invalid_count == 0:
              test_severity = "Pass"
          else:
              test_severity = "Warning"
         
          # Na začátku vytvořit seznam
          results_list = []

          # V cyklu přidávat do seznamu
          results_list.append({
              "test_name": "Is valid dates",
              "test_column": column_name,
              "data_type": column_types[column_name],
              "test_result": f"Valid: {valid_count}, Invalid: {invalid_count}",
              "test_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
              "test_severity": test_severity
          })

          # Na konci vytvořit DataFrame
          test_results = pd.concat([test_results, pd.DataFrame(results_list)], ignore_index=True)
    return test_results
test_results = is_valid_date(test_results, date_columns_names)    


#test of abnormalities or outliers of numeric columns
#IQR (Interquartile Range) Method 
def outliers_value_check(test_results, column_names):
    for column_name in column_names:
        if column_name in input_table:  
          Q1 = input_table[column_name].quantile(0.25)  # 1st quartile
          Q3 = input_table[column_name].quantile(0.75)  # 3rd quartile
          IQR = Q3 - Q1                   # Interquartile range

          # Define outlier bounds
          lower_bound = Q1 - 1.5 * IQR
          upper_bound = Q3 + 1.5 * IQR

          # Identify outliers
          outliers = input_table[(input_table[column_name] < lower_bound) | (input_table[column_name] > upper_bound)]
          outliers_count = len(outliers) 
          outliers_list =  outliers[column_name].tolist()
          print(outliers_list)
          test_results = pd.concat([test_results,pd.DataFrame({
                          "test_name": "Outliers value check",
                          "test_column": column_name,
                          "data_type": column_types[column_name],
                          "test_result": f"Lower bound: {lower_bound:.1f}, Upper bound: {upper_bound:.1f}, Outliers Count: {outliers_count:.1f}, Outliers List: {outliers_list}",
                          "test_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                          "test_severity": "No warning"
                      },index=[0])])
    return test_results
  
test_results = outliers_value_check(test_results, numeric_columns_names)
pd.set_option("display.max_colwidth", None)

#Save the test results table to CSV file
test_results.to_csv("out/tables/results", index= False)