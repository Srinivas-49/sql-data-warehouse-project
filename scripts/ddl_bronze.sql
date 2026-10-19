
exec bronze.load_bronze;
create  or alter procedure bronze.load_bronze as
begin
declare @start_time datetime,@end_date datetime;

print '=================================='
print 'loading broze layer'
print'===================='
set @start_date=getdate();
truncate table bronze.crm_cust_info

BULK INSERT bronze.crm_cust_info 
FROM 'C:\Users\Sanjay Reddy\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
SELECT count(*)
FROM   bronze.crm_cust_info;
 set @end_date=getdate();
 PRINT CONCAT('Duration: ', DATEDIFF(SECOND, @start_date, @end_date), ' seconds');

truncate table bronze.crm_prd_info
bulk insert  bronze.crm_prd_info
from  'C:\Users\Sanjay Reddy\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
with(
firstrow=2,
fieldterminator=',',
tablock);
select count(*) from bronze.crm_prd_info;


truncate table bronze.crm_sales_details
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\Sanjay Reddy\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
SELECT count(*)
FROM   bronze.crm_sales_details;

truncate table bronze.erm_cust_az12
BULK INSERT bronze.erm_cust_az12 
FROM 'C:\Users\Sanjay Reddy\Downloads\sql-data-warehouse-project-main\01_datasets\source_erp\cust_az12.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
SELECT count(*)
FROM   bronze.erm_cust_az12;

truncate table bronze.erm_loc_a101
BULK INSERT bronze.erm_loc_a101
FROM 'C:\Users\Sanjay Reddy\Downloads\sql-data-warehouse-project-main\01_datasets\source_erp\loc_a101.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
SELECT count(*)
FROM   bronze.erm_loc_a101;


truncate table bronze.erm_px_cat_g1v2
BULK INSERT bronze.erm_px_cat_g1v2
FROM 'C:\Users\Sanjay Reddy\Downloads\sql-data-warehouse-project-main\01_datasets\source_erp\px_cat_g1v2.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
select count(*) from bronze.erm_px_cat_g1v2;
end
