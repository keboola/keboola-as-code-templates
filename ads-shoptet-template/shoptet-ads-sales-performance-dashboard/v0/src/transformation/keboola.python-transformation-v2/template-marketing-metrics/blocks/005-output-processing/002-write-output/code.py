out_dir = os.path.join('out', 'tables')
os.makedirs(out_dir, exist_ok=True)

out_path = os.path.join(out_dir, 'marketing_metrics.csv')
df.to_csv(out_path, index=False)
