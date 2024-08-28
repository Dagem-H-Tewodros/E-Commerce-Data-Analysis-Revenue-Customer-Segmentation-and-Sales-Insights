# E-Commerce Data Analysis and Market Segmentation

## Overview
This project explores e-commerce sales data from an online retail platform, focusing on data cleaning, exploratory analysis, and customer segmentation. By leveraging MySQL for data cleaning and exploratory analysis, Python for market segmentation using RFM analysis and K-means clustering, and Power BI for visualization, we uncover key insights that drive business growth.

## Data Cleaning
The data cleaning process involved:
- **Correcting Negative Quantities:** Converted negative quantities to positive values to accurately reflect sales.
- **Standardizing Dates:** Transformed date formats to ensure consistency and accuracy.
- **Removing Zero-Priced Items:** Eliminated items with a unit price of zero to ensure valid revenue calculations.
- **Product Categorization:** Categorized products based on keywords in descriptions for more straightforward analysis.

## Exploratory Data Analysis (EDA)
Key analyses included:
- **Total Sales Revenue:** Identified the overall revenue, adjusting for failed transactions.
- **Failed Transactions:** Examined revenue lost due to cancellations and identified products most affected.
- **Top Products:** Analyzed top-selling and highest revenue-generating products.
- **Geographic Insights:** Assessed transaction distribution across countries.
- **Customer Analysis:** Calculated average order values and identified the most frequent customers.
- **Sales Trends:** Evaluated daily sales patterns to identify peak periods.

## Market Segmentation
We applied RFM (Recency, Frequency, Monetary) analysis to segment customers into distinct groups:
- **Cluster 0:** Recent, low-frequency, low-monetary customers.
- **Cluster 1:** Less recent, low-frequency, low-monetary customers.
- **Cluster 2:** Recent, high-frequency, high-monetary customers.
- **Cluster 3:** Very recent, medium-frequency, extremely high-monetary customers.

## Visualizations
The project includes a Power BI dashboard for visualizing the analysis results:
- **Sales Revenue Overview:** Total and net sales revenue with insights into failed transactions.
- **Customer Segmentation:** Visual representations of customer segments based on RFM metrics.
- **Product and Geographic Analysis:** Insights into top products and country-specific sales performance.

[**View the Power BI Dashboard**](https://your-powerbi-link-here)

## Conclusion
This analysis provides actionable insights into customer behavior, product performance, and sales trends, enabling strategic decision-making to enhance business growth.

## Files in this Repository
- `data_cleaning.sql`: SQL scripts for data cleaning.
- `exploratory_analysis.sql`: SQL scripts for exploratory data analysis.
- `market_segmentation.ipynb`: Jupyter Notebook for market segmentation analysis.



## How to Use
1. Clone the repository: `git clone https://github.com/yourusername/ecommerce-data-analysis.git`
2. Execute the SQL scripts to perform data cleaning and exploratory analysis.
3. Run the Jupyter Notebook for market segmentation analysis.
4. Open the Power BI dashboard to visualize the results.
5. Review the article for a detailed understanding of the project.


