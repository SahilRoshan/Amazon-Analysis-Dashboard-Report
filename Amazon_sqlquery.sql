--Creating table and importing data for each column
drop table if exists amazon;
CREATE TABLE amazon (
    product_id VARCHAR(50),
    product_name TEXT,
    category TEXT,
    discounted_price FLOAT,
    actual_price FLOAT,
    discount_percentage INT,
    rating VARCHAR(10),
    rating_count FLOAT,
    user_id VARCHAR(50),
    review_id TEXT,
    review_title TEXT,
    review_content TEXT
);
select*from amazon;

--EDA
--1.Are there any missing or null values in critical columns (e.g., discount_percentage, rating)?
select count(*) from amazon
where discount_percentage is null;

--2.Are there duplicate entries for products (based on product_id or product_name)?
select product_id,count(*)as duplicate_count from amazon
group by product_id
having count(*)>1;

--3.Are all discounted_price values lower than actual_price?
select count(*)from amazon
where discounted_price>actual_price;

--4.What is the correlation between discount_percentage and rating?
select corr(discount_percentage,rating::numeric)as correlation from amazon
where discount_percentage is not null and rating is not null;

--5.Is there a relationship between rating_count and discounted_price?
select corr(rating_count,discounted_price)as correlation from amazon;

--6.Which category has the most products?
select distinct category,count(product_id) as num_of_products from amazon
group by category
order by num_of_products desc;

--BUSINESS PROBLEMS
--7.What are the average actual and discounted prices per category?
select category,
round(avg(actual_price)::integer,2)as avg_actual_price,
round(avg(discounted_price)::integer,2)as avg_discounted_price 
from amazon
group by category
order by avg_actual_price desc;


--8.Which products have the highest sales discounts (discount_percentage) across categories?
select category,product_name
from(select category,product_name,
discount_percentage,
rank()over(partition by category order by discount_percentage desc)as rank
from amazon)as t1
where rank=1;

--9.What are the top highest-rated products in each category?
select category,product_name,rating
from amazon
group by category,product_name,rating
order by category,rating desc;

--10.Which categories have the most products with ratings above 4?
select category,count(product_name)as total_products_rating_4 from amazon
where rating::numeric >4
group by category
order by total_products_rating_4 desc;

--11.Which products have the most reviews (rating_count), and what are their ratings?
select product_name,rating_count,rating
from amazon
group by product_name,rating_count,rating
order by rating_count desc;

--12.What is the proportion of products receiving discounts greater than 50%?
select count(*)*1.0/(select count(*) from amazon)as prop_rcvg_grt_than_50 from amazon
where discount_percentage>50;

--13.What are the top 5 categories contributing the most to highly discounted products?
select category,max(discount_percentage) as max_discount 
from
    (select category,discount_percentage,
	rank() over(partition by category order by discount_percentage desc)as rank
from amazon)as t1
where rank=1
group by category
order by max_discount desc
limit 5

--14.Which users have submitted the most reviews, and which categories are they reviewing?
select user_id,category,count(review_content)as total_review from amazon
group by user_id,category
order by total_review desc

--15.What is the estimated revenue difference between actual price and discounted price for each category?
select category,(sum(actual_price)-sum(discounted_price))as  revenue_difference
from amazon
group by category
order by revenue_difference desc

--16.How do average ratings correlate with the discounted price and discount percentage?
select avg(cast(rating as float))as avg_rating,discounted_price,discount_percentage 
from amazon
group by 2,3

--17.Which product categories see the greatest variance in ratings based on their pricing tiers?
with pricing_tiers as (
       SELECT category,rating::numeric as rating,discounted_price,
       case when discount_percentage <35 then 'Low'
	        when discount_percentage between 35 and 60 then 'Medium'
			else 'High'
            end as pricing_tier
    from amazon
    where rating IS NOT NULL
)
select
    category, pricing_tier,VARIANCE(rating) AS rating_variance
from pricing_tiers
group by category, pricing_tier
order by rating_variance;

--18.Identify products with high discounts but low ratings. What insights can this reveal about quality vs. pricing?
select product_name,discount_percentage,cast(rating as float)as ratingg
from amazon
where discount_percentage>50 and cast(rating as float)< 3.5
group by 1,2,3
order by 2 desc;
--The query highlights a possible mismatch between customer expectations and product quality,
--even with aggressive discounting. This underscores the importance of balancing quality 
--and pricing strategies to ensure both customer satisfaction and sustainable sales performance.

--19.How does the frequency of reviews (rating_count) impact the average rating across different categories?
select category, rating_count,avg(cast(rating as float))as avg_rating
from amazon
where rating_count is not null
group by category,rating_count
order by rating_count desc

--20.Which user demographics (based on user activity like reviews submitted) are most influential in specific categories?
select  category, user_id,
        count(review_id) as reviews_submitted,
        avg(cast(rating as FLOAT)) as avg_rating_given
   from amazon
   group by category, user_id
   order by reviews_submitted DESC, avg_rating_given DESC;

--21.How does the number of reviews (rating_count) relate to the actual conversion rate (proxy through product popularity)?
select product_name,category,rating_count,discounted_price,
       cast(rating as float)as  avg_rating,
	   case when rating_count<1000 then 'Low'
	        when rating_count between 1000 and 5000 then 'Medium'
			else 'High'
			end as popularity_tier
	   from amazon
	   where rating_count is not null
	   order by rating_count desc;
