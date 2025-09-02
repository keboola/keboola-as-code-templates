order_codes = (
    orders[is_not_cancelled]
    .groupby('day')['code']
    .nunique()
    .reset_index()
    .rename(columns={'code': 'orders'})
)

currency_daily = (
    orders[is_not_cancelled]
    .groupby('day')['currencyCode']
    .agg(lambda s: s.astype(str).mode().iat[0] if not s.astype(str).mode().empty else '')
    .reset_index()
    .rename(columns={'currencyCode': 'currency'})
)
