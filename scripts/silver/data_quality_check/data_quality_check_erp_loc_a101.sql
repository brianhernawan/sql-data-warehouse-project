-- Data Quality Check erp_loc_a101

-- Data Standardisation & Consistency
SELECT DISTINCT cntry

FROM bronze.erp_loc_a101
ORDER BY cntry



-- Check Silver data Quality
SELECT DISTINCT
cid FROM silver.erp_loc_a101

SELECT DISTINCT
cntry FROM silver.erp_loc_a101