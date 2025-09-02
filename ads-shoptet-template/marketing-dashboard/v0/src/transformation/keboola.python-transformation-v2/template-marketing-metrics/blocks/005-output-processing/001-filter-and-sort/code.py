df = df[(df['orders'] > 0) | (df['ad_costs'] > 0)]
# Ensure date type for sorting and output as ISO string
df['date'] = pd.to_datetime(df['day'])
df = df.sort_values('date')

cols = [
    'date', 'orders', 'google_costs', 'meta_costs', 'other_costs',
    'ad_costs', 'cac', 'mer', 'revenue', 'cost_of_goods_sold',
    'cm2', 'cm3', 'roi', 'aov', 'currency'
]
df = df[cols]

# Convert date to ISO format string for CSV output
df['date'] = df['date'].dt.strftime('%Y-%m-%d')
