import pandas as pd
import sqlparse
import csv
import os
from typing import List
from kbc.env_handler import KBCEnvHandler

MANDATORY_PARAMS = []


class Group:
    pass
 
    
class Analyzer:
    
    def __init__(self, query: str, inputs: List, outputs: List):
        
        self.parameters = Group
        self.parameters.query = query
        self.parameters.inputs = inputs
        self.parameters.outputs = outputs
        
        self.identify_unused_tables()
        
    def identify_unused_tables(self):
        
        results = []
        
        for table in self.parameters.inputs:
            
            table_dict = table
            table_destination = table_dict['destination']
            
            if (table_destination in self.parameters.query or table_destination in self.parameters.outputs):
                is_used = True
                
            else:
                is_used = False
                
            table_dict['is_used'] = is_used
            results += [table_dict]
            
        self.results = results
            

class Component(KBCEnvHandler):
    
    def __init__(self):
        
        super().__init__(mandatory_params=MANDATORY_PARAMS)
        self.validate_config(mandatory_params=MANDATORY_PARAMS)
        
        self.tables_transformations = pd.read_csv(os.path.join(self.tables_in_path, 'transformations.csv'), dtype=str).fillna('')
        self.tables_inputs = pd.read_csv(os.path.join(self.tables_in_path, 'transformations-inputs.csv'), dtype=str).fillna('')
        self.tables_outputs = pd.read_csv(os.path.join(self.tables_in_path, 'transformations-outputs.csv'), dtype=str)
        self.tables_queries= pd.read_csv(os.path.join(self.tables_in_path, 'transformations-queries.csv'), dtype=str)
        
        self.writer = csv.DictWriter(open(os.path.join(self.tables_out_path, 'analyzer-inputs.csv'), 'w'),
                                    fieldnames=list(self.tables_inputs) + ['is_used'])
        self.writer.writeheader()
        
    
    def analyze_inputs(self):
        
        input = self.tables_transformations
        
        for _, transformation in input.iterrows():
            
            tid = transformation['id']
            
            inputs = self.tables_inputs.query("transformation_id == @tid").to_dict('records')
            outputs = self.tables_outputs.query("transformation_id == @tid").source.to_list()
            try:
                query = str(self.tables_queries.query("transformation_id == @tid")['script'].values[0])

            except IndexError:
                query = ''

            a = Analyzer(query, inputs, outputs)
            self.writer.writerows(a.results)
            
                   
    def run(self):
        
        self.analyze_inputs()
                       
c = Component()
c.run()
