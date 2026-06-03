-- Data Transformation

INSERT INTO silver.crm_cust_info (
	cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date)

SELECT
cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname, -- data cleansing, remove unwanted space
TRIM(cst_lastname) AS cst_lastname, -- data cleansing, remove unwanted space
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
	 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
	 ELSE 'n/a' -- handling missing data by filling the blanks with 'n/a' instead of NULL, dot or spaces
END cst_marital_status, -- data normalisation & stadardisation on marital status
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
	 ELSE 'n/a' -- handling missing data by filling the blanks with 'n/a' instead of NULL, dot or spaces
END cst_gndr, -- data normalisation & stadardisation on gender
cst_create_date
FROM(
	SELECT
	*,
	ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
	FROM bronze.crm_cust_info
	WHERE cst_id IS NOT NULL
)t WHERE flag_last = 1

