# Skip product type filtering if orderItemType is empty
# Only filter out cancelled orders
is_not_cancelled = ~orders['statusName'].astype(str).str.lower().str.contains('storn', na=False)
orders_ok = orders[is_not_cancelled].copy()
