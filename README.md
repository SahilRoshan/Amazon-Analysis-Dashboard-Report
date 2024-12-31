# Amazon Dataset Analysis Project

## Project Overview

This project focuses on analyzing and extracting valuable insights from an Amazon dataset. The dataset primarily deals with e-commerce product data, including attributes such as product details, pricing, discounts, ratings, and customer reviews. The goal is to perform exploratory data analysis (EDA), visualize key trends, and derive actionable insights. This project is designed to demonstrate data analysis, preprocessing, and querying skills, making it a valuable addition to your data science portfolio.

![amazon logo](https://github.com/user-attachments/assets/8fa7a9a3-96a2-4904-80d6-34e2cd2e8616)
---

## Dataset Details

### Table Structure
The dataset consists of the following columns:
- **product_id**: Unique identifier for each product.
- **product_name**: Name of the product.
- **category**: Product category.
- **discounted_price**: Price after applying the discount.
- **actual_price**: Original price of the product.
- **discount_percentage**: Percentage discount applied.
- **rating**: Average product rating.
- **rating_count**: Number of ratings received.
- **user_id**: Unique identifier for each user.
- **review_id**: Unique identifier for each review.
- **review_title**: Title of the review.
- **review_content**: Detailed review content.

---

## Objectives
This project involves:
1. **Dataset Walkthrough**:
   - Understanding the dataset structure and attributes.
   - Identifying missing or null values.
2. **Data Preprocessing**:
   - Cleaning the dataset by removing duplicates and handling missing values.
   - Verifying consistency between columns, such as prices and discounts.
3. **Exploratory Data Analysis (EDA)**:
   - Exploring correlations and trends.
   - Investigating product ratings and reviews.
4. **Data Visualization**:
   - Visualizing discounts, ratings, and other key metrics.

---

## Insights from Queries

### Insights Uncovered
1. **Missing Values**:
   - Critical columns like `discount_percentage` and `rating` were analyzed for null values.
   - Missing values were handled appropriately to ensure data integrity.
2. **Duplicate Entries**:
   - Identified duplicate products based on `product_id` and cleaned the dataset to prevent bias in analysis.
3. **Price Validation**:
   - Ensured that `discounted_price` is always less than `actual_price`.
4. **Correlation Analysis**:
   - Found a weak/moderate correlation between `discount_percentage` and `rating`, suggesting discounts have limited impact on ratings.
5. **Rating Distribution**:
   - Most products have ratings concentrated between 3.5 and 4.5, indicating general customer satisfaction.
6. **Category Trends**:
   - Categories with the highest number of products and best average ratings were identified.
7. **Review Analysis**:
   - Common phrases and sentiments in reviews were explored to provide qualitative insights.

### Additional Insights
1. **Top Products by Rating**:
   - Identified products with the highest ratings and significant review counts.
2. **Best Value Deals**:
   - Highlighted products with the highest discount percentages relative to their ratings.
3. **Category-Wise Discounts**:
   - Categories offering the best discounts were visualized.

---

## Career-Oriented Focus
This project highlights essential data science skills:
1. **SQL Proficiency**:
   - Writing complex queries to analyze large datasets.
2. **Data Cleaning and Preprocessing**:
   - Ensuring the dataset is analysis-ready.
3. **EDA and Visualization**:
   - Deriving actionable insights through statistical and visual techniques.
4. **Reporting and Documentation**:
   - Preparing comprehensive project documentation for stakeholders.

---

## Recommendations for Business Focus
This analysis identifies several key areas where the company can focus to drive business improvements:

1. **Enhance Customer Experience**:
   - Focus on improving product categories with lower ratings by addressing common complaints in reviews.
   - Monitor and respond to trends in review sentiments to maintain a positive brand image.

2. **Optimize Discounts and Pricing**:
   - Analyze the impact of discounts on sales and customer satisfaction to identify optimal pricing strategies.
   - Ensure competitive pricing in top-performing categories to maximize revenue.

3. **Promote High-Rated Products**:
   - Highlight products with high ratings and significant review counts in marketing campaigns.
   - Leverage positive reviews and ratings to build trust and attract new customers.

4. **Category-Specific Strategies**:
   - Invest in popular categories with high sales and ratings to further strengthen market presence.
   - Explore opportunities to improve or phase out underperforming categories.

---

## Portfolio-Ready Details
This project showcases:
- Problem-solving capabilities through SQL queries.
- Analytical skills by interpreting trends and patterns in e-commerce data.
- Business insights that can drive decision-making.
- Technical proficiency in data visualization.

---

## How to Use This Project
1. Clone or download the project repository.
2. Load the dataset into your SQL environment using the provided script.
3. Execute the queries to explore and analyze the data.
4. Follow the EDA steps and visualize the findings.

---

## Conclusion
This project is a comprehensive analysis of an e-commerce dataset, offering practical insights into customer behavior and product trends. It serves as an excellent demonstration of data analysis capabilities for a career in data science.

