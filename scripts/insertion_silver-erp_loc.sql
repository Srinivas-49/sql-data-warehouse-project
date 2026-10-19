insert into silver.erp_loc_a101(
cid,cntry)


select 
concat(left(cid,2),substring(cid,4,len(cid))) as cid,
case
when cntry in ('DE','Germany') then 'Germany'
when cntry in ('USA','United States','US') then 'United States'
when cntry is null or cntry=' ' then 'n/a'
else cntry
end as cntry
 from bronze.erp_loc_a101
