-- Data Transformation erp_loc_a101

INSERT INTO silver.erp_loc_a101(cid, cntry)
SELECT
	REPLACE(cid, '-', '') cid, -- handled invalid values
	CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
		 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
		 ELSE TRIM(cntry) -- Remove unwanted spaces
	END AS cntry -- Normalize and handle missing or blank country codes
FROM bronze.erp_loc_a101