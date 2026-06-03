-- Data quality check erp_px_cat_g1v2

-- Check for unwanted spaces
SELECT*
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat)

SELECT*
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
OR subcat != TRIM(subcat)

SELECT*
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
OR subcat != TRIM(subcat) 
OR maintenance != TRIM(maintenance) 

-- Data Standardisation & Consistency
SELECT DISTINCT
cat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
subcat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
maintenance
FROM bronze.erp_px_cat_g1v2




