ga4_daily = (
    ga4.groupby('day')['advertiserAdCost']
    .sum()
    .reset_index()
    .rename(columns={'advertiserAdCost': 'google_costs'})
)
