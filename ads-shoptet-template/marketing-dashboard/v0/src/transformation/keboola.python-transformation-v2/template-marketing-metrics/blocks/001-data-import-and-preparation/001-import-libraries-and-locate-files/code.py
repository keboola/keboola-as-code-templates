import os
import glob
import pandas as pd

orders_path = glob.glob(os.path.join('in', 'tables', '*orders.csv'))[0]
ga4_path = glob.glob(os.path.join('in', 'tables', '*raw_ad_analytics.csv'))[0]
insights_path = glob.glob(os.path.join('in', 'tables', '*ad_costs*insights.csv'))[0]
products_path = glob.glob(os.path.join('in', 'tables', '*products.csv'))[0]
