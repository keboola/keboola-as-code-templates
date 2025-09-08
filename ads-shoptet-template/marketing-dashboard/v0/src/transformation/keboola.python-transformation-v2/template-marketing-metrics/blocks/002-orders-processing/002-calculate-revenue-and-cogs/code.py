# Use totalPriceWithoutVat for revenue (convert comma decimal to dot)
orders_ok['revenue_clean'] = orders_ok['totalPriceWithoutVat'].astype(str).str.replace(',', '.').str.replace(' ', '')
orders_ok['revenue_clean'] = pd.to_numeric(orders_ok['revenue_clean'], errors='coerce').fillna(0)

rev_daily = (
    orders_ok.groupby('day')['revenue_clean']
    .sum()
    .reset_index()
    .rename(columns={'revenue_clean': 'revenue'})
)

# Compute COGS from products purchasePrice * quantity per order line
orders_ok['qty'] = pd.to_numeric(
    orders_ok.get('itemAmount', orders_ok.get('orderItemAmount', 1)), errors='coerce'
).fillna(1)
orders_ok['code_norm'] = orders_ok.get('itemCode', orders_ok.get('code', ''))
lines = orders_ok.merge(products[['code', 'purchasePrice']].rename(columns={'code':'code_norm'}), on='code_norm', how='left')
lines['line_cogs'] = (pd.to_numeric(lines['purchasePrice'], errors='coerce').fillna(0.0) * pd.to_numeric(lines['qty'], errors='coerce').fillna(1.0))
cogs_daily = (
    lines.groupby('day')['line_cogs']
    .sum()
    .reset_index()
    .rename(columns={'line_cogs': 'cost_of_goods_sold'})
)
