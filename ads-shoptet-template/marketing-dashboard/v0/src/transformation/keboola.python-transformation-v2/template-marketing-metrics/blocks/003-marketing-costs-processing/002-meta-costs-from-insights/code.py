meta_daily = (
    insights.groupby('day')['spend']
    .sum()
    .reset_index()
    .rename(columns={'spend': 'meta_costs'})
)
