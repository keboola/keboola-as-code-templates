orders['date'] = pd.to_datetime(orders['date'])
ga4['date'] = pd.to_datetime(ga4['date'])
insights['date'] = pd.to_datetime(insights['date_start'])

orders['day'] = orders['date'].dt.date.astype(str)
ga4['day'] = ga4['date'].dt.date.astype(str)
insights['day'] = insights['date'].dt.date.astype(str)
products['purchasePrice'] = pd.to_numeric(products['purchasePrice'], errors='coerce').fillna(0.0)
