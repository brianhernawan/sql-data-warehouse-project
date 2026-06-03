-- Data quality check erp_cust_az12
 
SELECT
	cid,
	bdate,
	gen
FROM bronze.erp_cust_az12
WHERE cid LIKE '%AW00011000%'

SELECT
	cid,
	CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		 ELSE cid
	END AS cid,
	bdate,
	gen
FROM bronze.erp_cust_az12
WHERE CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		 ELSE cid
	  END NOT IN (SELECT DISTINCT cst_key FROM silver.crm_cust_info)

SELECT * FROM [silver].[crm_cust_info]

-- identify Out-of-Range Dates

SELECT DISTINCT
bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Standardisation & Consistency
SELECT DISTINCT gen
FROM bronze.erp_cust_az12

-- silver data quality check
SELECT
cid,
COUNT(*)
FROM silver.erp_cust_az12
GROUP BY cid
HAVING COUNT(*) > 1 OR cid IS NULL

SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

SELECT DISTINCT
gen
FROM silver.erp_cust_az12