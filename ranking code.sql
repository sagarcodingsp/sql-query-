select * from store ;
select sales , 
case 
when sales>100 then "low "
when sales>500 then "mid"
when sales>1000 then "high"
else " very high "
end as sales_category
from store ;

select coalesce(post_code , city) from store ;

select name , sales , rank ()  
over (order by sales desc ) as ranking 
from store ;

select name , qty , rank ()  
over (order by qty desc ) as ranking 
from store ;

select name , qty , dense_rank ()  
over (order by qty desc ) as ranking 
from store ;

select name , qty , row_number ()
over (order by qty desc ) as ranking 
from store ;

select name , sales , dense_rank ()  
over (order by sales desc ) as ranking 
from store ;

select name , region   , dense_rank ()  
over (partition by region    order by city  desc) as ranking 
from store ; 