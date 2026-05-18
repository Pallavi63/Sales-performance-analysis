-- ============================================================
-- Sales Performance Dashboard
-- Step 2: SQL Analysis Queries
-- Author: Burugu Pallavi
-- Tool: SQLiteOnline.com → Import sales_cleaned.csv
-- Table name: sales_cleaned
-- ============================================================


-- ============================================================
-- QUERY 1: OVERALL BUSINESS SNAPSHOT
-- Purpose : Single row summary of entire business
-- Metrics : Revenue, Cost, Profit, Margin, Orders, AOV
-- ============================================================

SELECT
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(cost), 2)                                 AS total_cost,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_profit_margin_pct,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue) / COUNT(*), 2)                   AS avg_order_value
FROM sales_cleaned;


-- ============================================================
-- QUERY 2: REVENUE & PROFIT BY YEAR
-- Purpose : Year over year performance comparison
-- Insight  : Is the business growing?
-- ============================================================

SELECT
    year,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(cost), 2)                                 AS total_cost,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    ROUND(SUM(revenue) / COUNT(*), 2)                   AS avg_order_value
FROM sales_cleaned
GROUP BY year
ORDER BY year ASC;


-- ============================================================
-- QUERY 3: MONTHLY REVENUE TREND
-- Purpose : How does revenue change month by month?
-- Insight  : Spot seasonality — which months are peak sales?
-- Dashboard: This feeds the Area Chart
-- ============================================================

SELECT
    year,
    month,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct
FROM sales_cleaned
GROUP BY year, month
ORDER BY year ASC,
    CASE month
        WHEN 'January'   THEN 1
        WHEN 'February'  THEN 2
        WHEN 'March'     THEN 3
        WHEN 'April'     THEN 4
        WHEN 'May'       THEN 5
        WHEN 'June'      THEN 6
        WHEN 'July'      THEN 7
        WHEN 'August'    THEN 8
        WHEN 'September' THEN 9
        WHEN 'October'   THEN 10
        WHEN 'November'  THEN 11
        WHEN 'December'  THEN 12
    END ASC;


-- ============================================================
-- QUERY 4: REVENUE BY COUNTRY
-- Purpose : Which country drives the most revenue?
-- Insight  : USA dominates at 46% — where to expand next?
-- Dashboard: This feeds the Filled Map
-- ============================================================

SELECT
    country,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    ROUND(SUM(revenue) * 100.0 /
        (SELECT SUM(revenue) FROM sales_cleaned), 2)    AS revenue_share_pct
FROM sales_cleaned
GROUP BY country
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 5: REVENUE BY PRODUCT CATEGORY
-- Purpose : Which category is the top performer?
-- Insight  : Bikes = 51% of revenue but what about margin?
-- Dashboard: This feeds the Donut Chart
-- ============================================================

SELECT
    product_category,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    ROUND(SUM(revenue) * 100.0 /
        (SELECT SUM(revenue) FROM sales_cleaned), 2)    AS revenue_share_pct
FROM sales_cleaned
GROUP BY product_category
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 6: REVENUE BY SUB CATEGORY
-- Purpose : Which specific product is the best seller?
-- Insight  : Drills down from category to product level
-- ============================================================

SELECT
    product_category,
    sub_category,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct
FROM sales_cleaned
GROUP BY product_category, sub_category
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 7: REVENUE BY CUSTOMER AGE GROUP
-- Purpose : Which age group spends the most?
-- Insight  : Helps target marketing to right demographic
-- Dashboard: This feeds the Column Chart
-- ============================================================

SELECT
    age_group,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    ROUND(SUM(revenue) / COUNT(*), 2)                   AS avg_order_value
FROM sales_cleaned
GROUP BY age_group
ORDER BY
    CASE age_group
        WHEN '18-25' THEN 1
        WHEN '26-35' THEN 2
        WHEN '36-45' THEN 3
        WHEN '46-55' THEN 4
        WHEN '55+'   THEN 5
    END ASC;


-- ============================================================
-- QUERY 8: REVENUE BY GENDER
-- Purpose : Do male or female customers spend more?
-- Insight  : Helps shape product and marketing decisions
-- ============================================================

SELECT
    customer_gender,
    COUNT(*)                                            AS total_orders,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    ROUND(SUM(revenue) / COUNT(*), 2)                   AS avg_order_value
FROM sales_cleaned
GROUP BY customer_gender
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 9: CATEGORY PERFORMANCE BY COUNTRY
-- Purpose : Does product preference vary by country?
-- Insight  : Maybe Germany prefers Accessories over Bikes?
--            Useful for country-specific stock decisions
-- ============================================================

SELECT
    country,
    product_category,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    COUNT(*)                                            AS total_orders
FROM sales_cleaned
GROUP BY country, product_category
ORDER BY country, total_revenue DESC;


-- ============================================================
-- QUERY 10: BEST AND WORST PERFORMING MONTHS
-- Purpose : Which month has highest and lowest revenue?
-- Insight  : Plan inventory and promotions around peak months
-- ============================================================

SELECT
    month,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    COUNT(*)                                            AS total_orders
FROM sales_cleaned
GROUP BY month
ORDER BY total_revenue DESC;


-- ============================================================
-- QUERY 11: PROFIT MARGIN BY CATEGORY
-- Purpose : Bikes drive revenue but are they most profitable?
-- Insight  : High revenue category might have low margin
--            This is a critical business finding
-- ============================================================

SELECT
    product_category,
    ROUND(SUM(revenue), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                               AS total_profit,
    ROUND(AVG(profit_margin_pct), 2)                    AS avg_margin_pct,
    ROUND(MIN(profit_margin_pct), 2)                    AS min_margin_pct,
    ROUND(MAX(profit_margin_pct), 2)                    AS max_margin_pct
FROM sales_cleaned
GROUP BY product_category
ORDER BY avg_margin_pct DESC;


-- ============================================================
-- QUERY 12: YEAR OVER YEAR GROWTH BY COUNTRY
-- Purpose : Which country grew the most from 2015 to 2016?
-- Insight  : Find the fastest growing market
-- ============================================================

SELECT
    country,
    ROUND(SUM(CASE WHEN year = 2015 THEN revenue ELSE 0 END), 2)    AS revenue_2015,
    ROUND(SUM(CASE WHEN year = 2016 THEN revenue ELSE 0 END), 2)    AS revenue_2016,
    ROUND(
        (SUM(CASE WHEN year = 2016 THEN revenue ELSE 0 END) -
         SUM(CASE WHEN year = 2015 THEN revenue ELSE 0 END)) * 100.0
        / NULLIF(SUM(CASE WHEN year = 2015 THEN revenue ELSE 0 END), 0)
    , 2)                                                             AS yoy_growth_pct
FROM sales_cleaned
GROUP BY country
ORDER BY yoy_growth_pct DESC;
