-- Data Quality checks

-- Check FOR Nulls or Duplicates in Primary Key
-- Expectation: No Result

SELECT
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- Check latest data
SELECT
*
FROM(
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM bronze.crm_cust_info
)t WHERE flag_last = 1 AND cst_id = 29466;

-- Check for unwanted Spaces for customer key
-- Expectation: No Result
SELECT cst_key
FROM bronze.crm_cust_info
WHERE cst_key != TRIM(cst_key)

-- Check for unwanted Spaces for customer first name
-- Expectation: No Result
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Check for unwanted Spaces for customer last name
-- Expectation: No Result
SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Check for unwanted Spaces for gender
-- Expectation: No Result
SELECT cst_gndr
FROM bronze.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)

-- Data Standardisation & Consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info