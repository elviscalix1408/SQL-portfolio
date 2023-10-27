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
	
/*PART 2*/

/* Next I am asked to get a distinct list. I have added the DISTINCT statemetn
in the SELECT statement to produce a result set without duplicate brand names*/
	
Select
	distinct
		f.brand_name
from
foods f

/*Assignment 2.2: provide the distinct values of the Storage type fields*/

Select
	distinct
		f.storage_type
from
foods f

/*Assignment 2.3: Update the 'NULL' record to 'unknown' to make more sense to
the end user, to accomplish this I will use the UPDATE, SET, WHERE and IS
statements as shown below

NOTE: double check for null values with select statement before running the
update below*/

update
	foods f
set storage_type = 'unknown'
where
	storage_type is null
	
	/*double checking to make sure the records were updated by 
	running the DISTINCT command for the storage type again*/

Select
	distinct
		f.storage_type
from
		foods f

/* Assignment 2.4: I was assigned to look for food_id 13, 15, and 17, I used the
WHERE statement to provide the conditions for the database, and the OR statement
to provide furhter conditions for the data that is to be obtained*/

select
	*
from foods f
where
	f.food_id = 13
	or f.food_id = 15
	or f.food_id = 17
having
	f.brand_name = 'H-E-B (private label)'
	

	/*next I was asked to provide further filtering to get a result set
	that only included the 'H-E-B (private label)' brand name. for this,
	i simply needed to add an AND and ILIKE statement to search for the
	Specific brand name, as seen below*/

select
	*
from foods f
where
	 (f.food_id = 13
	or f.food_id = 15
	or f.food_id = 17)
	and f.brand_name ilike 'h-e-b (private label)'
	
/*Assignment 2.5: I was asked to create a new column that will have the total
count of each storage_type per brand_name. I used the COUNT and GROUP BY statement
below to aggregate all the storage_types per brand_name. COUNT in this 
scenario served as a new column storing the requested calculation*/

select
	f.brand_name
	,f.storage_type
	, count(*) as record_count
from
	foods f
group by
	f.brand_name
	, f.storage_type
	
/* We know that we wanna have a percentage output the percent of plabel brands vs 
all count of all pl / by all brands*/

select
	lower (f.brand_name)
	, count(*) as record_count
from
	foods f
group by
	f.brand_name
Having
	lower (f.brand_name) = 'h-e-b (private label)'
	
select
	f.brand_name
	, (cast(f.brand_name as int))/ count(cast(f.brand))
from
	foods f
group by
	f.brand_name
	
/*finding the percentage of 'H-E-B (private label)' brands that are in the table,
calculate it by dividing the total number of 'H-E-B (private label) brand by the
total brand count

In this case, I used CAST to convert the values of two encased tables, one representing
the total count of brand names, and the other representing only the total
number 'H-E-B (private label)' products

CAST is necessary in case to convert two varying character values to a decimal, necessary
to run an equation on these columns

The cross join statement allows for all the values of n.heb_records table 
to be divided by d.total_records, as seen in the CAST statement*/

select
	cast(n.heb_records as decimal (10,2)) / cast(d.total_records as decimal(10,2))
	as heb_percentage
	from

			(select
				count(*) as heb_records
			from
				foods f
			where
				lower (f.brand_name)= 'h-e-b (private label)') n -- numerator 
				
			cross join
			
			(select
				count(*) as total_records
			from
				foods f) d --denominator 
				
/*PART 3*/

select
	*
from
	foods

/*Assignment 3: I was asked to return the distinct values in the price_last_updated_ts
using DISTINCT statement for the price_last_updated_ts, since that is
the column we want DISTINCT values for */

Select
	distinct
		f.price_last_updated_ts
from
	foods f
	
/*Assignment 3.1: list all the products, create a separate column 
to Flag all the products that need updating

Calculate the number of days its been since the price was last updated, so I am tasked
to list all the produce food columns next and add current_date

Also was tasked with converting the timestamp to my timezone to match my city, as seen
below*/

select
	 f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts at time zone 'America/New_York' as price_last_updated_est_ts
	, current_timestamp
	, (current_timestamp - f.price_last_updated_est_ts) as timestamp_last_updated
from
	foods f
	
	/*I am tasked now with finding the different between current_timestamp and 
	price_last_updated_ts column, as seen below, I add a new column with that calculation
	in the select statement*/
	
select
	 f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts at time zone 'America/New_York' as price_last_updated_est_ts
	, current_timestamp
	, (current_timestamp - f.price_last_updated_ts) as days_since_price_last_updated
from
	foods f
	
	/*Instructions now: add a date column and subtract current_date to price last updated
	using CAST to update the 'Price_last_updated_ts' column to date, to perform 
	calculation and only display the number of days since price was last updaed without
	the timestamp*/
select
	*
from
			(select
				 f.food_id
				, f.item_name
				, f.storage_type
				, f.package_size
				, f.package_size_uom
				, f.brand_name
				, f.package_price
				, f.price_last_updated_ts at time zone 'America/New_York' as price_last_updated_est_ts
				, current_timestamp
				/* (current_timestamp - f.price_last_updated_ts) as days_since_price_last_updated*/
				, current_date - cast  (
										(f.price_last_updated_ts at time zone 'America/New_York')as date)
												as days_since_last_update
			from
				foods f) f
			where
				f.days_since_last_update > 265


/*PART 4*/

/*Assignment 4: Working with drinks and foods table

Produce a result set that has all the data from one table combined with the other table

For this I used UNION ALL statement to list all data

I then created a new column titled 'Source_table' so the data can be traced back
to its original table*/



(select
	f.food_id
 	, f.item_name
 	, f.storage_type
 	, f.package_size
 	, f.package_size_uom as package_size_unit_of_measurement
 	, f.brand_name
 	, f.package_price
 	, f.price_last_updated_ts
 	, 'foods data' as source_table
from
	foods f )
	
union all
	
(select
	d.drink_id
 	, d.item_name
 	, d.storage_type
 	, d.package_size
 	, d.package_size_uom as package_size_unit_of_measurement
 	, d.brand_name
 	, d.package_price
 	, d.price_last_updated_ts
 	, 'drinks data' as source_table
from
	drinks d)
	

/*Now I need to separate the food_id and drink_id column for futher differentiation

For this I will create two new columns, on the foods_id, I apply 'null' to drink_id,
and on the drinks table, I apply the null value to the food_id*/


		(select
			f.food_id
		 	, null as drink_id
			, f.item_name
			, f.storage_type
			, f.package_size
			, f.package_size_uom as package_size_unit_of_measurement
			, f.brand_name
			, f.package_price
			, f.price_last_updated_ts
			, 'foods data' as source_table
		from
			foods f )

		union all

		(select
		 	null as food_id
			, d.drink_id
			, d.item_name
			, d.storage_type
			, d.package_size
			, d.package_size_uom as package_size_unit_of_measurement
			, d.brand_name
			, d.package_price
			, d.price_last_updated_ts
			, 'drinks data' as source_table
		from
			drinks d)

/*PART 5*/

/*Assignment 5: produce output that will give me all fo the food
items, but add a column that shows the inventory we have

*/

Select
	*
from
food_inventories

select
	*
from
	foods
	
select
	f.item_name
	, i.quantity
from 
	foods f
		join
			food_inventories
	
	

				
