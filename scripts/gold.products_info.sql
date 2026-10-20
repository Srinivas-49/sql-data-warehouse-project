create view gold.dim_products as 
select 
row_number() over(order by pn.prd_start_dt,pn.prd_key) as product_key,
pn.prd_id as  product_id,

pn.prd_key as product_number,
pn.prd_nm as product_name,
pn.cat_id as category_id,
px.cat as category,
px.subcat as subcategory,

px.maintenance,
pn.prd_cost as cost,
pn.prd_line as product_line,
pn.prd_start_dt as start_date


from silver.crm_prd_info as pn left join silver.erp_px_cat_g1v2 as px on pn.cat_id=px.id
where prd_end_dt  is null --filterout all historical data
