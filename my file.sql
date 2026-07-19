create database class10 ;
use class10 ;
drop database class10 ;

drop table customer ;
create table customer 
(name varchar(30), age tinyint, height double  , amount int  , dob date  );
describe customer ;	
-- this is our code for table 
# hy i am creating this 
alter table customer 
add address varchar(100);
alter table customer 
modify column name varchar(100);

alter table customer 
change column amount sales double;

alter table customer 
drop column address ;
alter table new_customer 
rename to customer;
insert into customer 
values("sagar",23,5.6,345.55,"2026-06-05");
select * from customer ;

insert into customer 
values ("vinni",24,5.3,34555.55,"2026-06-05"), ("amit",34,4.6,837483.43,"2026-06-05");
insert into customer (name,age)
values("anmol",34);
select* from customer ;
update customer
set age=78,height="5.4"
where name ="anmol";
set sql_safe_updates=0;
delete From customer 
where name="anmol";
create table emp
( empid int unique ,
name varchar(30) not null ,
city varchar(30) default "indore"
);

describe emp;

insert into emp
values (1,"rohan","jabalpur");
select * from emp ;
insert into emp
values (2,"anmol ","bhopal");

create table vote(
name varchar(30),
age int,
constraint check_age check (age>=18)
);
describe vote;
show create table vote;
select * from emp ;

insert into vote values ("sagar",45);
insert into vote values ("raghav",13);




drop table customer ;

create table customer (
cid int not null unique  ,
name varchar (50)
);

insert into customer
 values (1,"ravi"),(2,"shyam");

create table sales (
product varchar (50),
amount int,
cid int,
foreign key (cid) references customer  (cid)
);

insert into sales 
values (  "biscuit ",3456 , 1);
insert into sales 
values (  "rice ",346 , 2);


create table test as 
select name , sales , profit , qty , sales-profit  from store ;


describe customer ;

show create table customer ;

select name , sales , profit , qty , sales-profit as cost  from store ;

select name as customer_name , sales , profit , qty , sales-profit as cost  from store ;
select sum(sales) as total_sales  ,
sum(profit) as total_profit ,
 min(sales) as minimum ,
 max(sales ) as maximum ,
 avg(sales) as average ,
 count(sales)
from store ;

select name ,region from store 
where region !="east";

select sum(sales) 
from store 
where region = "west" and sales <10 ;

select * from store 
where sub_category= "art"
and category="office supplies"
and region ="east";

select distinct name from  store 
where name like "a%th";

select distinct name from  store 
where name like "f%th";
select distinct sub_category
 from  store 
where sub_category like "____";

select order_date , sales 
from store 
where order_date between "2016-1-1"and "2016-4-30";

select * from store 
where post_code is null ;
select * from store 
where post_code is not null ;


select order_date ,
sales from store 
where order_date < "2015-01-01" ;

select name , sales 
from store 
order by sales ;

select name , sales 
from store 
order by sales desc ;

select category , sub_category ,sales
from store 
where category = "furniture "
order by category , sub_category ,sales desc ;

select name sales from store 
order by sales 
limit 3 ;

select name  from store 
order by profit desc 
limit 5 ;

select name , profit 
from store 
order by profit desc 
limit 1 offset 1;

select name , sales  
from store 
order by sales desc 
limit 1 offset 2;
select region , sum(sales)
from store 
group by region ;

select sub_category , 
 round (sum(sales)) as Total_Sales  
, round (sum(profit)) as Total_Profit 
, round (avg(qty ) , 2 ) as Average_Quantity
from store 
group by sub_category
order by Total_Sales desc;

select category , sub_category ,
 round (sum(sales)) as Total_Sales  
, round (sum(profit)) as Total_Profit 
, round (avg(qty ) , 2 ) as Average_Quantity
from store 
group by category , sub_category
order by Total_Sales desc;

select name , round (sum(sales)) Total_sales
from store
group by name 
having  Total_sales > 3000 
order by Total_sales desc;

select sub_category ,
round (sum(profit)) as Total_Profit 
from store 
group by  sub_category
having Total_profit < 0
order by Total_Profit  desc;


select * from emp ;
select * from dep;

select * from emp left join dep 
on emp.depid=  dep.depid ;

select * from emp right  join dep 
on emp.depid=  dep.depid ;


select emp.depid , dep,depid  from emp right  join dep 
on emp.depid=  dep.depid ;


select * from 
emp left join  dep on
emp.depid = dep.depid
union 
select * from 
emp right join  dep on
emp.depid = dep.depid  ;


select e.name  as employee , m.name as manager 
from emp as e join emp as m 
on e.manager_id  = m.empid;


select name , sales 
from store 
where sales >=(select avg(sales) from store );

select name , profit  
from store 
where profit  <=(select avg(profit) from store) 
order by profit desc;

with 
test as (
select * , sales- profit as cost 
from store ) 

select *  from test
where cost <= 10 ;

with 
test as (
select profit , if(profit >0, "profit", "loss" ) 
as pnl from store  )
select pnl ,count(profit ) , sum(profit ) , avg(profit )
from test 
group by pnl ;


