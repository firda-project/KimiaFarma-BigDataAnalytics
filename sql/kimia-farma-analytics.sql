-- CHECK MISSING VALUE
-- kf_final_transaction
SELECT
  SUM(
    CASE WHEN transaction_id IS NULL
    THEN 1 ELSE 0
    END
  ) transaction_id_missing,

  SUM(
    CASE WHEN date IS NULL
    THEN 1 ELSE 0
    END
  ) date_missing,

  SUM(
    CASE WHEN branch_id IS NULL
    THEN 1 ELSE 0
    END
  ) branch_id_missing,
  
  SUM(
    CASE WHEN customer_name IS NULL
    THEN 1 ELSE 0
    END
  ) customer_name_missing,
  
  SUM(
    CASE WHEN product_id IS NULL
    THEN 1 ELSE 0
    END
  ) product_id_missing,
  
  SUM(
    CASE WHEN price IS NULL
    THEN 1 ELSE 0
    END
  ) price_missing,
  
  SUM(
    CASE WHEN discount_percentage IS NULL
    THEN 1 ELSE 0
    END
  ) discount_percentage_missing,
  
  SUM(
    CASE WHEN rating IS NULL
    THEN 1 ELSE 0
    END
  ) rating_missing
FROM
`decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction`;

-- kf_inventory
SELECT
  SUM(
    CASE WHEN Inventory_ID IS NULL
    THEN 1 ELSE 0
    END
  ) Inventory_ID_missing,

  SUM(
    CASE WHEN branch_id IS NULL
    THEN 1 ELSE 0
    END
  ) brach_id_missing,

  SUM(
    CASE WHEN product_id IS NULL
    THEN 1 ELSE 0
    END
  ) product_id_missing,

  SUM(
    CASE WHEN product_name IS NULL
    THEN 1 ELSE 0
    END
  ) product_name_missing,

  SUM(
    CASE WHEN opname_stock IS NULL
    THEN 1 ELSE 0
    END
  ) opname_stock_missing
FROM
`decisive-engine-323312.pbi2_big_data_analytics.kf_inventory`;

-- kf_kantor_cabang
SELECT
  SUM(
    CASE WHEN branch_id IS NULL
    THEN 1 ELSE 0
    END
  ) branch_id_missing,

  SUM(
    CASE WHEN branch_category IS NULL
    THEN 1 ELSE 0
    END
  ) branch_category_missing,

  SUM(
    CASE WHEN branch_name IS NULL
    THEN 1 ELSE 0
    END
  ) brach_name_missing,

  SUM(
    CASE WHEN kota IS NULL
    THEN 1 ELSE 0
    END
  ) kota_missing,

  SUM(
    CASE WHEN provinsi IS NULL
    THEN 1 ELSE 0
    END
  ) provinsi_missing,

  SUM(
    CASE WHEN rating IS NULL
    THEN 1 ELSE 0
    END
  ) rating_missing
FROM
`decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang`;

-- kf_product
SELECT
  SUM(
    CASE WHEN product_id IS NULL
    THEN 1 ELSE 0
    END
  ) product_id_missing,

  SUM(
    CASE WHEN product_name IS NULL
    THEN 1 ELSE 0
    END
  ) product_name_missing,

  SUM(
    CASE WHEN product_category IS NULL
    THEN 1 ELSE 0
    END
  ) product_category_missing,

  SUM(
    CASE WHEN price IS NULL
    THEN 1 ELSE 0
    END
  ) price_missing
FROM
`decisive-engine-323312.pbi2_big_data_analytics.kf_product`;


-- CHECK DUPLICATED DATA
-- kf_final_transaction
SELECT
  transaction_id,
  date,
  branch_id,
  customer_name,
  product_id,
  price,
  discount_percentage,
  rating,
  COUNT(*) duplicated_count
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction`
GROUP BY
  transaction_id,
  date,
  branch_id,
  customer_name,
  product_id,
  price,
  discount_percentage,
  rating
HAVING COUNT(*) > 1;

-- kf_inventory
SELECT
  Inventory_ID,
  branch_id,
  product_id,
  product_name,
  opname_stock,
  COUNT(*) duplicated_count
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_inventory`
GROUP BY
  Inventory_ID,
  branch_id,
  product_id,
  product_name,
  opname_stock
HAVING COUNT(*) > 1;

-- kf_kantor_cabang
SELECT
  branch_id,
  branch_category,
  branch_name,
  kota,
  provinsi,
  rating,
  COUNT(*) duplicated_count
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang`
GROUP BY
  branch_id,
  branch_category,
  branch_name,
  kota,
  provinsi,
  rating
HAVING COUNT(*) > 1;

-- kf_product
SELECT
  product_id,
  product_name,
  product_category,
  price,
  COUNT(*) duplicated_count
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_product`
GROUP BY
  product_id,
  product_name,
  product_category,
  price
HAVING COUNT(*) > 1;

-- CHECK PRIMARY KEY
-- fk_final_transaction
SELECT
  COUNT(*) total_rows,
  COUNT(transaction_id) non_null_id,
  COUNT(DISTINCT transaction_id) unique_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction`;

-- kf_inventory
SELECT
  COUNT(*) total_rows,
  COUNT(Inventory_ID) non_null_id,
  COUNT(DISTINCT Inventory_ID) unique_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_inventory`;

-- kf_kantor_cabang
SELECT
  COUNT(*) total_rows,
  COUNT(branch_id) non_null_id,
  COUNT(DISTINCT branch_id) unique_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang`;

-- kf_product
SELECT
  COUNT(*) total_rows,
  COUNT(product_id) non_null_id,
  COUNT(DISTINCT product_id) unique_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_product`;


-- CHECK FOREIGN KEY
-- kf_final_transaction
SELECT
  ft.branch_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction` ft
LEFT JOIN
  `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang` kc
ON
  ft.branch_id = kc.branch_id
WHERE
  ft.branch_id IS NOT NULL AND
  kc.branch_id IS NULL;

SELECT
  ft.product_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction` ft
LEFT JOIN
  `decisive-engine-323312.pbi2_big_data_analytics.kf_product` p
ON
  ft.product_id = p.product_id
WHERE
  ft.product_id IS NOT NULL AND
  p.product_id IS NULL;

-- kf_inventory
SELECT
  i.branch_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_inventory` i
LEFT JOIN
  `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang` kc
ON
  i.branch_id = kc.branch_id
WHERE
  i.branch_id IS NOT NULL AND
  kc.branch_id IS NULL;

SELECT
  i.product_id
FROM
  `decisive-engine-323312.pbi2_big_data_analytics.kf_inventory` i
LEFT JOIN
  `decisive-engine-323312.pbi2_big_data_analytics.kf_product` p
ON
  i.product_id = p.product_id
WHERE
  i.product_id IS NOT NULL AND
  p.product_id IS NULL;


-- SET PK AND FK
-- kf_kantor_cabang
ALTER TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang`
ADD PRIMARY KEY (branch_id) NOT ENFORCED;

-- kf_product
ALTER TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_product`
ADD PRIMARY KEY (product_id) NOT ENFORCED;

-- kf_inventory
ALTER TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_inventory`
ADD PRIMARY KEY (Inventory_ID) NOT ENFORCED,
ADD FOREIGN KEY (branch_id)
  REFERENCES `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang` (branch_id) NOT ENFORCED,
ADD FOREIGN KEY (product_id)
  REFERENCES `decisive-engine-323312.pbi2_big_data_analytics.kf_product` (product_id) NOT ENFORCED;

-- kf_final_transaction
ALTER TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction`
ADD PRIMARY KEY (transaction_id) NOT ENFORCED,
ADD FOREIGN KEY (branch_id)
  REFERENCES `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang` (branch_id) NOT ENFORCED,
ADD FOREIGN KEY (product_id)
  REFERENCES `decisive-engine-323312.pbi2_big_data_analytics.kf_product` (product_id) NOT ENFORCED;


-- CREATE TABLE kf_analisa
CREATE OR REPLACE TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_analisa` AS

WITH
  ft AS (SELECT * FROM `decisive-engine-323312.pbi2_big_data_analytics.kf_final_transaction`),
  kc AS (SELECT * FROM `decisive-engine-323312.pbi2_big_data_analytics.kf_kantor_cabang`),
  p AS (SELECT * FROM `decisive-engine-323312.pbi2_big_data_analytics.kf_product`)
  
SELECT
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  ft.customer_name,
  ft.product_id,
  p.product_name,
  ft.price AS actual_price,
  ft.discount_percentage,

  CASE
    WHEN ft.price <= 50000 THEN 0.10
    WHEN ft.price <= 100000 THEN 0.15
    WHEN ft.price <= 300000 THEN 0.20
    WHEN ft.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  ROUND(
    ft.price * (1 - ft.discount_percentage),
    2
  ) AS nett_sales,

  ROUND(
    (ft.price * (1 - ft.discount_percentage)) *
    (
      CASE
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price <= 100000 THEN 0.15
        WHEN ft.price <= 300000 THEN 0.20
        WHEN ft.price <= 500000 THEN 0.25
        ELSE 0.30
      END
    ),
    2
  ) AS nett_profit,

  ft.rating AS rating_transaksi

FROM ft
LEFT JOIN kc
  ON ft.branch_id = kc.branch_id
LEFT JOIN p
  ON ft.product_id = p.product_id
  
ORDER BY ft.date;


-- YoY
CREATE OR REPLACE TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_yoy` AS
WITH yearly AS (
  SELECT
    EXTRACT(YEAR FROM date) AS year,
    SUM(nett_profit) AS total_nett_profit,
    SUM(nett_sales) AS total_nett_sales
  FROM `decisive-engine-323312.pbi2_big_data_analytics.kf_analisa`
  GROUP BY EXTRACT(YEAR FROM date)
)
SELECT
  year,
  total_nett_profit,

  LAG(total_nett_profit) OVER (
    ORDER BY year
  ) AS prior_year_profit,

  ROUND(
    (
      total_nett_profit -
      LAG(total_nett_profit) OVER (
        ORDER BY year
      )
    )
    /
    LAG(total_nett_profit) OVER (
      ORDER BY year
    )
    * 100,
    2
  ) AS yoy_profit,

  total_nett_sales,

  LAG(total_nett_sales) OVER (
    ORDER BY year
  ) AS prior_year_sales,

  ROUND(
    (
      total_nett_sales -
      LAG(total_nett_sales) OVER (
        ORDER BY year
      )
    )
    /
    LAG(total_nett_sales) OVER (
      ORDER BY year
    )
    * 100,
    2
  ) AS yoy_sales
FROM yearly
ORDER BY year;


-- MoM
CREATE OR REPLACE TABLE `decisive-engine-323312.pbi2_big_data_analytics.kf_mom` AS
WITH monthly AS (
    SELECT
        EXTRACT(YEAR FROM date) AS year,
        EXTRACT(MONTH FROM date) AS month,
        SUM(nett_profit) AS total_nett_profit,
        SUM(nett_sales) AS total_nett_sales
    FROM `decisive-engine-323312.pbi2_big_data_analytics.kf_analisa`
    GROUP BY
        EXTRACT(YEAR FROM date),
        EXTRACT(MONTH FROM date)
)

SELECT
    year,
    month,
    total_nett_profit,

    LAG(total_nett_profit) OVER (
        ORDER BY year, month
    ) AS prior_month_profit,

    ROUND(
        (
            total_nett_profit -
            LAG(total_nett_profit) OVER (
                ORDER BY year, month
            )
        )
        /
        LAG(total_nett_profit) OVER (
            ORDER BY year, month
        )
        * 100,
        2
    ) AS mom_profit,

    total_nett_sales,

    LAG(total_nett_sales) OVER (
        ORDER BY year, month
    ) AS prior_month_sales,

    ROUND(
        (
            total_nett_sales -
            LAG(total_nett_sales) OVER (
                ORDER BY year, month
            )
        )
        /
        LAG(total_nett_sales) OVER (
            ORDER BY year, month
        )
        * 100,
        2
    ) AS mom_sales

FROM monthly
ORDER BY year, month;