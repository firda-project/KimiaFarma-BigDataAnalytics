# Kimia Farma - Big Data Analytics Project

## 📌 Project Overview
This project evaluates **Kimia Farma's business performance from 2020 to 2023** using transaction, branch, product, and inventory data.

The project applies an end-to-end analytics workflow, starting from raw CSV datasets, followed by data quality checking and SQL-based transformation in **Google BigQuery**, and ending with an interactive **Looker Studio dashboard** for business performance analysis.

The analysis focuses on **sales, profit, branch, product, geographic, and customer experience performance** to generate actionable business insights.

---

## 📊 Dataset

The project uses four CSV datasets:

| Dataset | Description |
|---|---|
| `kf_final_transaction` | Transaction-level sales and customer rating data |
| `kf_inventory` | Inventory and stock information by branch and product |
| `kf_kantor_cabang` | Branch master data and branch ratings |
| `kf_product` | Product master data and product categories |

Table relationship:

![Table Relationship](/assets/table-relationship.png)

---

## 📈 Dashboard
![Dashboard Preview](/assets/dashboard_preview.png)

The final output is an interactive Kimia Farma Business Performance Analytics Dashboard developed in Looker Studio.

1. **Overall Business Performance**

    Provides a high-level view of:

    - Total transactions
    - Nett sales
    - Nett profit
    - Annual sales and profit trends
    - Monthly sales trends
    - Average branch and transaction ratings
2. **Branch & Product Performance**

    Analyzes:

    - Top provinces by transactions
    - Top provinces by nett sales
    - Branch category contribution
    - Top products by nett sales
    - Top cities by nett sales
3. **Geographic & Customer Analysis**

    Analyzes:

    - Nett profit distribution across Indonesia
    - Sales and profit by province
    - Transaction ratings by province
    - Branch ratings by province
    - Branches with high branch ratings but low transaction ratings

**Dashboard Filters**

- Date
- Province
- City
- Branch
- Product

---
## 💡 Business Recommendations

- **Monitor sales fluctuations** to identify recurring periods of lower performance.
- **Benchmark high-performing branches and cities** to identify potentially replicable practices.
- **Evaluate high-contributing product categories** for further sales and profitability analysis.
- **Investigate transaction-level customer experience** where transaction ratings are substantially lower than branch ratings.
- **Prioritize branches with large rating gaps** for further service-quality investigation.

---

## 🛠️ Tools

- Google BigQuery
- SQL
- Looker Studio 
- CSV

---

## 📁 Repository Structure

``` text
KimiaFarma-BigDataAnalytics/
│
├── README.md
│
├── sql/
│   └── kimia-farma-analytics.sql
│
├── dashboard/
│   └── dashboard-link.md
│
├── assets/
│   ├── dashboard-preview.png
│   ├── page1.jpg
│   ├── page2.jpg
│   ├── page3.jpg
│   └── table-relationship.png
│
└── documentation/
    └── project_presentation.pdf
```


---

## 🔗 Project Links
* **Interactive Dashboard:** [View Dashboard Here](https://lookerstudio.google.com/)
* **Presentation Deck:** [View Presentation Deck](https://drive.google.com/file/d/13uo7ucrz-04oFOgcckp3JUNjKX0JpR5N/view?usp=sharing)

---

## 👩‍💻 Author
**Firda Angzalna Putri**  
- [LinkedIn](https://linkedin.com/in/firda-angzalna-putri/)
- [GitHub](https://github.com/firda-project)