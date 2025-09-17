order_codes = (
    orders[is_not_cancelled]
    .groupby('day')['code']
    .nunique()
    .reset_index()
    .rename(columns={'code': 'orders'})
)

currency_col = 'currencyCode' if 'currencyCode' in orders.columns else 'currency'

currency_daily = (
    orders[is_not_cancelled]
    .groupby('day')[currency_col]
    .agg(lambda s: s.astype(str).mode().iat[0] if not s.astype(str).mode().empty else '')
    .reset_index()
    .rename(columns={currency_col: 'currency'})
)