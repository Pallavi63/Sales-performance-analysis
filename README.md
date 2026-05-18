
# Sales Performance Dashboard

## Project Overview
End-to-end sales analytics project analyzing 34,865 transactions across 4 countries, 3 product categories, and 2 years (2015–2016) for a bicycle accessories retail business. The goal was to identify revenue trends, uncover profitability gaps, and deliver actionable business recommendations through an interactive Power BI dashboard.

---

## Dashboard Preview
![Sales Performance Dashboard]("C:\Users\burug\OneDrive\Desktop\projects\Sales performance\Screenshot (84).png")

---

## Tools Used
| Tool | Purpose |
|---|---|
| Python (Pandas, NumPy) | Data cleaning, feature engineering |
| SQL (SQLite) | Business queries & metric calculation |
| Microsoft Excel | Pivot tables & summary analysis |
| Power BI | Interactive single-page dashboard |

---

## Dataset
- **Source:** [Sales Data for Economic Data Analysis — Kaggle](https://www.kaggle.com/datasets/abhishekrp1517/sales-data-for-economic-data-analysis)
- **Size:** 34,865 rows × 16 columns (after cleaning)
- **Countries:** United States, United Kingdom, Germany, France
- **Product Categories:** Bikes, Accessories, Clothing
- **Date Range:** July 2015 — July 2016

---

## Project Structure
```
sales-performance-dashboard/
│
├── data/
│   └── sales_sample.csv                ← 1000 row sample (full data on Kaggle)
│
├── python/
│   └── sales_data_cleaning.py          ← cleaning & feature engineering script
│
├── sql/
│   └── sales_analysis.sql              ← 12 business queries
│
├── excel/
│   └── sales_performance_analysis.xlsx ← 10 pivot tables
│
├── screenshots/
│   └── sales_dashboard.png             ← final Power BI dashboard
│
└── README.md
```

---

## Step 1 — Data Cleaning (Python)

Performed the following operations on the raw dataset:

- Dropped 2 useless columns: `Column1` (32,000+ nulls) and `index` (row numbers)
- Removed 1 fully null row — confirmed zero remaining nulls
- Confirmed zero duplicate rows across 34,865 records
- Standardised all column names to lowercase with underscores
- Fixed data types: `date` → datetime, `year` and `quantity` → integer
- Standardised text values to consistent Title Case

**3 new columns engineered:**
- `profit` = Revenue − Cost → actual earnings per transaction
- `profit_margin_pct` = (Profit / Revenue) × 100 → efficiency metric
- `age_group` = bucketed customer ages into 5 brackets (18-25, 26-35, 36-45, 46-55, 55+)

---

## Step 2 — SQL Analysis (12 Queries)

| Query | Business Question |
|---|---|
| Q1 | Overall business snapshot |
| Q2 | Revenue & profit by year |
| Q3 | Monthly revenue trend |
| Q4 | Revenue by country |
| Q5 | Revenue by product category |
| Q6 | Revenue by sub category |
| Q7 | Revenue by customer age group |
| Q8 | Revenue by gender |
| Q9 | Category performance by country |
| Q10 | Best and worst performing months |
| Q11 | Profit margin by category |
| Q12 | Year over year growth by country |

---

## Step 3 — Excel Analysis (10 Pivot Tables)

| Pivot Table | Analysis |
|---|---|
| PT1 | Revenue, Profit & Margin by Category |
| PT2 | Revenue by Country |
| PT3 | Monthly Revenue Trend 2015 vs 2016 |
| PT4 | Revenue by Age Group |
| PT5 | Revenue by Gender |
| PT6 | Profit Margin by Category & Year |
| PT7 | Revenue by Sub Category |
| PT8 | Country Performance by Year |
| PT9 | Category Performance by Country |
| PT10 | Best and Worst Performing Months |

---

## Step 4 — Power BI Dashboard

Single-page dark-themed interactive dashboard with 8 visuals and 2 slicers.

### KPI Cards (Top Row)
| Metric | Value |
|---|---|
| Total Revenue | $22.3M |
| Total Profit | $2.26M |
| Profit Margin % | 13.41% |
| Total Orders | 34,865 |
| YoY Growth % | 24.62% |

### Visuals
| Visual | Chart Type | Insight |
|---|---|---|
| Revenue Trend by Month | Area Chart | Peak months May–June, consistent 2016 growth |
| Revenue by Product Category | Donut Chart | Bikes 51.4%, Accessories 33.2%, Clothing 15.4% |
| Profit Margin % by Category | Color-coded Bar | Accessories 17% (green), Clothing 15% (yellow), Bikes 1% (red) |
| Revenue vs Profit by Country | Clustered Bar | USA highest revenue, Germany highest profit ratio |
| Revenue by Age Group | Bar Chart | 26-35 age group drives most revenue at $8M |
| Female vs Male Revenue | Donut Chart | Near-equal split: Male 51%, Female 49% |

### Slicers
- Year (2015 / 2016)
- Country (France / Germany / United Kingdom / United States)

---

## Key Findings

### Finding 1 — Critical Profit Gap in Bikes (Most Important)
| Category | Revenue | Revenue Share | Profit Margin |
|---|---|---|---|
| Bikes | $11.4M | 51.4% | **1.03%** 🔴 |
| Accessories | $7.4M | 33.2% | **16.98%** 🟢 |
| Clothing | $3.4M | 15.4% | **14.80%** 🟡 |

Bikes generate over half of all revenue but retain only **$1 of every $100 earned** in profit. Accessories are **16x more profitable per dollar** despite generating less revenue. This is the most critical business finding — the company is over-reliant on a near-breakeven product.

---

### Finding 2 — Germany is the Fastest Growing Market
| Country | 2015 Revenue | 2016 Revenue | YoY Growth |
|---|---|---|---|
| Germany | $1.77M | $2.47M | **+39.36%** 🚀 |
| United Kingdom | $1.89M | $2.38M | +25.72% |
| France | $1.54M | $1.90M | +23.11% |
| United States | $4.73M | $5.64M | +19.15% |

USA is the largest market at $10.3M but growing the slowest at 19.15%. Germany — despite being the 3rd largest market — grew nearly twice as fast at 39.36%, making it the highest-potential market for investment.

---

### Finding 3 — Strong Overall Business Growth
- Revenue grew from **$9.94M (2015)** to **$12.39M (2016)** — a **24.62% increase**
- All 4 countries showed positive growth
- Peak revenue months: **May and June** — strong summer seasonality

---

### Finding 4 — Primary Customer Segment
- The **26-35 age group** drives the most revenue at **$8M**
- The **36-45 age group** is second at **$7M**
- Together these two segments account for **67% of total revenue**
- Gender has no significant impact — 51% Male vs 49% Female

---

## Business Recommendations

1. **Investigate Bike pricing strategy** — 1.03% margin is unsustainable. Either increase prices or reduce costs to reach at least 10% margin
2. **Increase Accessories marketing spend** — highest margin category at 16.98%, most profitable per dollar earned
3. **Prioritise Germany for expansion** — fastest growing market at 39.36% YoY, significant upside potential
4. **Target 26-45 age group** in marketing — drives 67% of total revenue
5. **Plan inventory around May-June peak** — highest revenue months, ensure stock availability

---

## How to Run

**Python cleaning:**
```bash
pip install pandas numpy openpyxl
jupyter notebook python/sales_data_cleaning.py
```

**SQL queries:**
1. Go to https://sqliteonline.com
2. Import `data/sales_sample.csv`
3. Run queries from `sql/sales_analysis.sql`

**Power BI dashboard:**
1. Download [Power BI Desktop](https://powerbi.microsoft.com/desktop) (free)
2. Open `sales_performance_dashboard.pbix`
3. Use Year and Country slicers to filter interactively

---

## What I Learned
- How to engineer business metrics (profit, margin, age groups) from raw transactional data
- How high revenue does not always mean high profitability — Bikes vs Accessories margin gap
- How to build conditional color formatting in Power BI to highlight critical vs healthy metrics
- How to identify growth opportunities from YoY analysis — Germany emerging market finding

---

## Author
**Burugu Pallavi**
- LinkedIn: [PallaviBurugu](https://linkedin.com/in/PallaviBurugu)
- GitHub: [PallaviBurugu](https://github.com/PallaviBurugu)
- Email: burugupallavi123@gmail.com
