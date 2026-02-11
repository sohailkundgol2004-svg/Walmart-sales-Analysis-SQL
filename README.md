# Walmart-sales-Analysis-SQL
🛒 Walmart Sales Data Analysis (SQL Project) 📌 Project Overview  This project contains SQL-based analysis performed on the Walmart Sales dataset. The objective of this project is to explore sales performance, customer behavior, product trends, and revenue insights using SQL queries.



The dataset includes transactional sales data such as:

* Invoice ID
* Branch
* City
* Customer Type
* Gender
* Product Line
* Unit Price
* Quantity
* Tax (VAT)
* Total
* Date & Time
* Payment Method
* Rating

---

## 🛠️ Tools & Technologies Used

* MySQL
* SQL (Aggregation, Window Functions, CASE Statements)
* Data Cleaning using ALTER & UPDATE
* Grouping & Analytical Queries

---

# 📊 Analysis Performed

---

## 🏙️ 1️⃣ Generic Analysis

* ✔️ Number of distinct cities in dataset
* ✔️ Branch location per city

---

## 📦 2️⃣ Product Analysis

* ✔️ Number of distinct product lines
* ✔️ Most common payment method
* ✔️ Most selling product line
* ✔️ Total revenue by month
* ✔️ Month with highest COGS
* ✔️ Product line generating highest revenue
* ✔️ City with highest revenue
* ✔️ Product line with highest VAT
* ✔️ Product category classification (Good / Bad based on average sales using Window Function)
* ✔️ Branch selling above average quantity
* ✔️ Most common product line by gender
* ✔️ Average rating per product line

### 🔹 Advanced Concepts Used:

* `CASE WHEN`
* `AVG() OVER()` Window Function
* `GROUP BY`
* `ORDER BY`
* `ALTER TABLE`
* `UPDATE`

---

## 💰 3️⃣ Sales Analysis

* ✔️ Sales count by time of day per weekday
* ✔️ Customer type generating highest revenue
* ✔️ City with highest VAT collected
* ✔️ Customer type paying most VAT

### 🔹 Time-based Classification:

Sales were categorized into:

* Morning
* Afternoon
* Evening

Using `CASE` statement and `TIME` conditions.

---

## 👥 4️⃣ Customer Analysis

* ✔️ Unique customer types
* ✔️ Unique payment methods
* ✔️ Most common customer type
* ✔️ Customer type generating most revenue
* ✔️ Gender distribution overall
* ✔️ Gender distribution per branch
* ✔️ Time of day with highest ratings
* ✔️ Time of day ratings per branch
* ✔️ Best average rating by weekday
* ✔️ Best average rating per branch per weekday

---

# 📈 Key Insights

* 📍 Naypyitaw generated the highest revenue.
* 🏆 Sports and Travel was among the highest revenue generating product lines.
* 🍔 Food and Beverages had the highest VAT contribution.
* 💳 Cash / Ewallet (based on query result) was one of the most used payment methods.
* 👥 Member customers generated higher revenue compared to Normal customers (based on analysis).
* ⭐ Certain weekdays performed better in customer ratings.

---

# 🧠 Skills Demonstrated

* Data Cleaning using SQL
* Business Problem Solving
* Revenue Analysis
* Customer Segmentation
* Time-Based Analysis
* Window Functions
* Analytical Thinking

---

# 🚀 How to Use This Project

1. Import the Walmart dataset into MySQL.
2. Run the SQL queries provided in the `.sql` file.
3. Analyze the outputs for insights.
4. Modify queries for deeper analysis if required.

---

# 📌 Project Structure

```
📂 Walmart-SQL-Analysis
 ├── walmart_sales_analysis.sql
 └── README.md
```

---

# 🎯 Conclusion

This project demonstrates how SQL can be used to perform complete business analysis on retail sales data.
It highlights strong understanding of aggregation, grouping, window functions, and business insight extraction.

---

## 📎 Author

**Your Name Here**
Aspiring Data Analyst | SQL | Python | Power BI

---

⭐ If you found this project useful, feel free to star the repository!
