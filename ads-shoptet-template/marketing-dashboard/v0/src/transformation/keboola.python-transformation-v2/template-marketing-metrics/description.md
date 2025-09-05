# Marketing Metrics Transformation

## Overview
This transformation consolidates e-commerce order data with advertising spend from multiple channels to calculate key marketing performance metrics on a monthly basis.

## Input Files

### 1. **Orders Data** (`*orders.csv`)
- **Source**: Shoptet e-commerce platform
- **Key Fields Used**:
  - `date` - Order timestamp
  - `code` - Unique order identifier
  - `totalPriceWithoutVat` - Order revenue (excluding VAT)
  - `statusName` - Order status (filters out cancelled orders)
  - `currencyCode` - Transaction currency

### 2. **Google Ads Data** (`*raw_ad_analytics.csv`)
- **Source**: Google Analytics 4
- **Key Fields Used**:
  - `date` - Campaign date
  - `advertiserAdCost` - Daily advertising spend on Google

### 3. **Meta Ads Data** (`*ad_costs*insights.csv`)
- **Source**: Meta (Facebook/Instagram) Ads Manager
- **Key Fields Used**:
  - `date_start` - Campaign start date
  - `spend` - Advertising spend on Meta platforms

## Output File

### **Marketing Metrics** (`marketing_metrics.csv`)
A monthly aggregated table containing:

| Column | Description |
|--------|-------------|
| `year_month` | Month identifier (YYYY-MM format) |
| `orders` | Count of unique orders |
| `google_costs` | Google Ads spend |
| `meta_costs` | Meta Ads spend |
| `other_costs` | Placeholder for additional channels (currently 0) |
| `ad_costs` | Total advertising spend |
| `cac` | Customer Acquisition Cost (ad costs ÷ orders) |
| `mer` | Marketing Efficiency Ratio (revenue ÷ ad costs) |
| `revenue` | Total revenue excluding VAT |
| `cost_of_goods_sold` | Product costs (if available) |
| `cm2` | Contribution Margin 2 (revenue - COGS) |
| `cm3` | Contribution Margin 3 (CM2 - ad costs) |
| `roi` | Return on Investment (CM3 ÷ ad costs) |
| `aov` | Average Order Value (revenue ÷ orders) |
| `currency` | Primary currency code |

## Processing Logic

1. **Data Cleaning**: Filters out cancelled orders (containing "storn" in status)
2. **Time Aggregation**: Groups all metrics by month
3. **Cost Consolidation**: Combines advertising costs from multiple channels
4. **Metric Calculation**: Computes marketing KPIs and efficiency ratios
5. **Quality Filter**: Only outputs months with actual business activity

## Notes
- Handles European number formats (comma as decimal separator)
- Automatically detects input files using pattern matching
- Fills missing advertising data with zeros to maintain continuity
- Designed for Shoptet e-commerce platform data structure
