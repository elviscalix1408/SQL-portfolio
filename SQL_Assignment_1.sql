/*Below I have been assigned to create the following tables where data will be
imported into*/

create table foods
(
food_id bigint,
item_name character varying(255),
storage_type character varying(255),
package_size integer,
package_size_uom character varying(255),
brand_name character varying(255),
package_price numeric(10,2),
price_last_updated_ts timestamp without time zone
)
;

CREATE TABLE food_inventories
(
food_inventory_id bigint,
food_item_id bigint,
quantity integer,
inventory_dt date
)

;

create table drinks
(
drink_id bigint,
item_name character varying(255),
storage_type character varying(255),
package_size integer,
package_size_uom character varying(255),
brand_name character varying(255),
package_price numeric(10,2),
price_last_updated_ts timestamp without time zone
)
;

/*After cleaning the data, creating a diagram of the data and importing it I am
assigned to the following*/


/* Assignment 1: Count all the records with the COUNT statement*/
select
	count(*) as record_count
from
	foods f
	

/* Assignment 2: update column 'package_size_uom' to something
stakeholders can understand below is the code to that change. I am able to
temporarily change the name with the AS statement as shown below*/

select
	f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom as package_size_unit_of_measurement
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts
from
	foods f

/*another option is to permanently change the column name is using the ALTER command
as seen below*/

alter table foods
	rename package_size_uom   to package_size_unit_of_measurement

select
	*
from
	foods

/*Assignment 3: return the value of */


	


/*Assignment 2:count the records that are 'H-E-B (private label), two ways to do
1.) GROUP BY and HAVING command if you need to consolidate the results by
brand_name 2.) you can also add the WHERE command to simply list all 
'H-E-B (private label)'*/
	
select
	f.brand_name
	, count(*) as record_count
from
	foods f
group by f.brand_name
Having
	f.brand_name = 'H-E-B (private label)'
	
/*Here I use the simple WHERE statement to filter through what I need*/
	
select
	 f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price

from
	foods f
where 
	brand_name='H-E-B (private label)'
	
/*Taking case sensitivity into consdieration, we can also use the LOWER
statement to pull every record under the 'H-E-B (private label)' regardless
of case. the LOWER statment serves as the logic of the statement but
returns the data in its original format. It does not change the format
of the data*/	

select
	 f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price

from
	foods f
where 
	lower (brand_name) = 'h-e-b (private label)'
	
/*The ILIKE statement also allows logic to take place, return data in original
regardless of case sensitivity, as seen below, the % sign after the 'h-e-b'
instructs the database to search for anything after 'h-e-b' and return it*/
	
select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price

from
	foods f
where 
	f.brand_name ilike 'h-e-b%'

/*Assignment 5: I am instructed to make the brand_name output all upper case
Using the UPPER statement in the select statement to transform the output of the 
brand_name to all UPPER case, as seen below*/

select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, upper (f.brand_name)
	, f.package_price


from
	foods f
where 
	f.brand_name ilike 'h-e-b%'

/*Assignment 6: make a new column to the output 'is_canned_yn' which will
tell us if the item is canned or not, I am also using the CASE statement
to populate the data based off item-name and whether or not it has 'canned'
in the name, as seen below

'%' sign on either side of the of 'canned' instructs the database
to disregard case and look for 'canned' in this column and return no matter
the format or where it is placed*/

select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, case when item_name ilike '%canned%' then 'yes'
		else 'no'
	end
	as is_canned_yn
from
	foods f
	
/* Assignment 7: find any 'null' value under the 'brand_name' column i will 
accomplish this by using the WHERE statement as seen below*/

select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
from
	foods f
where
	brand_name is null

/*Assignment 8: count how many items belong to each brand, creating a result set
listing both the brand name and total number of items under each brand_name, for
this query I will use the COUNT statement and GROUP BY for the total
I also used ORDER BY to order by ascending order, DESC woul be descending*/

Select
	f.brand_name
	, count(*) as record_count
from
	foods f
group by
	f.brand_name
order by
	f.brand_name asc
	

	
Select
	*
from
foods
	
