cm2_daily = rev_daily.merge(cogs_daily, on='day', how='outer')
cm2_daily['cm2'] = cm2_daily['revenue'] - cm2_daily['cost_of_goods_sold']

df = (
    order_codes
    .merge(cm2_daily[['day', 'revenue', 'cost_of_goods_sold', 'cm2']], on='day', how='outer')
    .merge(ga4_daily, on='day', how='outer')
    .merge(meta_daily, on='day', how='outer')
    .merge(currency_daily, on='day', how='outer')
)

df = df.fillna({
    'orders': 0,
    'revenue': 0,
    'cost_of_goods_sold': 0,
    'cm2': 0,
    'google_costs': 0,
    'meta_costs': 0
})
