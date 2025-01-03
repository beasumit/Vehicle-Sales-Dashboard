-- opening database
use classicmodels;

-- checking all the tables in the database
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;

-- updating the sql safe update option to modify the data without restriction
set sql_safe_updates = 0;

#adding Profit column and its datatype
alter table products      
add column profit decimal(10,2);


#Updating Profit column with data
update products
set profit_per_unit = MSRP - buyPrice;

-- updating the columns with NA value.
update orders
set comments = 'NA'
where comments is null;

-- checking the udppated value
select * from orderdetails 
where orderNumber is Null;

-- cleaning the data 
delete from offices
where city is null;

-- checking the data
#after adding the null state data is 71 only. 
select customername, addressLine1, addressLine2, city, state, postalcode, country from customers
where state is null;

-- adding states Name Where data is NULL
update customers
set state = 'Loire-Atlantique'
where city = 'Nantes';


update customers
set state = 'London'
where city = 'London';


update customers
set state = 'Hessen'
where city = 'Frankfurt';

update customers
set state = 'Vestfold county'
where city = 'Stavern';

update customers
set state = 'Auckland'
where city = 'Auckland';

update customers
set state = ' Berlin'
where city = 'Berlin';


-- checking data per country
select customername, addressLine1, addressLine2, city, state, postalcode, country from customers
where state is null 
group by country;

-- updating the remaining rows
update customers
set state = ' Saint Petersburg'
where city = 'Saint Petersburg';

update customers
set state = 'Wellington'
where city = 'Wellington';

update customers
set state = ' Singapore'
where city = 'Singapore';

update customers
set state = 'Auvergne-Rhône-Alpes'
where city = 'Lyon';

update customers
set state = 'North Rhine-Westphalia'
where city = 'Köln';

-- checking for NULL values in offices table
select * from offices
where state is null;

-- updating the row where data is NULL
update offices
set state = 'Île-de-France'
where city = 'Paris';

update offices
set state = 'London'
where city = 'London';

update offices
set state = 'New South Wales'
where city = 'Sydney';