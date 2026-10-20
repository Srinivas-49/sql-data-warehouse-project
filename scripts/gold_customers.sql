create view gold.dim_customers as

select 
row_number() over(order by cst_id) as customer_key,
sc.cst_id as customer_id,
sc.cst_key as customer_number,
sc.cst_firstname as  first_name,
sc.cst_lastname as last_name,
sel.cntry as country,
sc.cst_marital_status as marital_status,


case
when sc.cst_gndr <> 'n/a' then sc.cst_gndr
else coalesce(se.gen,'n/a')
end as gender,
se.bdate as  birthdate,
sc.cst_create_date as create_date
from silver.crm_cust_info as sc left join silver.erp_cust_az12  as se on sc.cst_key=se.cid
                                left join silver.erp_loc_a101 as sel on sc.cst_key=sel.cid 
