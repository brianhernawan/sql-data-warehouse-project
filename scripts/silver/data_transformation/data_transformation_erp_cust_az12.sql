-- Data Transformation erp_cust_az12
INSERT INTO silver.erp_cust_az12 (cid, bdate, gen)
SELECT
	CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		 ELSE cid
	END AS cid, -- Handled invalid values - Remove 'NAS' prefix if present
	CASE WHEN bdate > GETDATE() THEN NULL
		ELSE bdate
	END AS bdate, -- Handled invalid values - set future birthdates to NULL
	CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
		 WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
		 ELSE 'n/a'
	END AS gen -- Normalise gender values and handle unknown cases
FROM bronze.erp_cust_az12
WHERE CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		 ELSE cid
	  END NOT IN (SELECT DISTINCT cst_key FROM silver.crm_cust_info)