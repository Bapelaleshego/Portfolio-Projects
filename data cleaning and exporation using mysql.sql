select *
from logistics;

--- Identyfing and removing duplicates if there is any

select ID, count(*) 
from logistics
group by ID
having count(*)>1;

--- Correcting data entries

set SQL_SAFE_UPDATES =0;

alter table logistics 
modify column ReachedonTime text;

update logistics
set ReachedonTime =
case ReachedonTime
when 'yes' then 'yes'
when 0 then 'no'
end 
where ReachedonTime in ('yes', 0);

select ReachedonTime
from logistics;

--- TOTAL NUMBER OF ORDERS

select count(ID)
from logistics;

--- TOTAL NUMBER OF ORDERS ARRIVED ON TIME

select count(ReachedonTime)
from logistics
where ReachedonTime = 'yes';

--- WHICH MODE OF SHIPMENT THAT HAVE THE HIGH REACHED ON TIME VALUE

select Mode_of_shipment, count(ReachedonTime)
from logistics
where ReachedonTime = 'yes'
group by Mode_of_Shipment
order by ReachedonTime desc;

--- WHICH WAREHOUSE THAT HAVE THE HIGH REACHED ON TIME VALUE

select Warehouse_block, count(ReachedonTime)
from logistics
where ReachedonTime = 'yes'
group by Warehouse_block
order by ReachedonTime desc;

--- WAREHOUE VS SHIPMENT MODE ON REACHED ON TIME

select Warehouse_block,Mode_of_Shipment, count(ReachedonTime)
from logistics
where ReachedonTime = 'yes'
group by Warehouse_block,Mode_of_Shipment
order by ReachedonTime;

--- DOES SHIPMENT TIME DEPEND ON PRODUCT IMPORTANCE

select Product_importance, count(ReachedonTime)
from logistics
where ReachedonTime = 'yes'
group by Product_importance
order by ReachedonTime desc;

--- WHICH SHIPMENT MODE CARRY THE HEAVY WEIGHT PRODUCTS
 
select Mode_of_Shipment,max(Weight_in_gms) as max_weight,min(Weight_in_gms) as min_weight
from logistics
group by Mode_of_Shipment;

--- HOW MANY TIMES DOES THE CUSTOMER CALLS BEFORE THEIR PRODUCTS ARRIVE

select Customer_care_calls, count(ReachedonTime)
from logistics
where ReachedonTime = 'yes'
group by Customer_care_calls
order by ReachedonTime desc;

--- HOW DOES LATE DELIVARIES AFFECT THE RETURN AND RATINGS OF CUSTOMERS

select Customer_rating, Prior_purchases,Customer_care_calls, count(ReachedonTime)
from logistics
where ReachedonTime = 'no'
group by Customer_rating, Prior_purchases,Customer_care_calls
order by ReachedonTime desc;