df['other_costs'] = 0.0
df['ad_costs'] = df['google_costs'] + df['meta_costs'] + df['other_costs']
df['cac'] = df.apply(lambda r: r['ad_costs'] / r['orders'] if r['orders'] > 0 else 0, axis=1)
df['mer'] = df.apply(lambda r: r['revenue'] / r['ad_costs'] if r['ad_costs'] > 0 else 0, axis=1)
df['cm3'] = df['cm2'] - df['ad_costs']
df['roi'] = df.apply(lambda r: r['cm3'] / r['ad_costs'] if r['ad_costs'] > 0 else 0, axis=1)
df['aov'] = df.apply(lambda r: r['revenue'] / r['orders'] if r['orders'] > 0 else 0, axis=1)
