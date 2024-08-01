select  *
from information_schema.columns
where table_name = 'payment'

Explain select * from film;

INSERT INTO category(name) VALUES ('Thriller'),('Crime'),('Mystery'),('Romance'),('War');

select film_id 
from film
where title ='African Egg';


select category_id
from film_category
where film_id =5;

select  name from category
where category_id =8;

select  category_id from category
where name = 'Thriller'

update film_category
set category_id = 17  
where category_id =8

SELECT *, category_id
FROM category
WHERE film_id = 5;


delete from category
where name = 'Mystery' ;


CREATE TABLE EMPLOYEES
 (
employee_id VARCHAR(30) NOT NULL,
name VARCHAR(50),
contact_number VARCHAR(30),
designation_id INT,
last_update TIMESTAMP NOT NULL DEFAULT now(),
CONSTRAINT employee_pkey PRIMARY KEY (employee_id)
);


select * 
from payment
order by amount asc;


select *
from city
order by city_id
limit 10;

SELECT rating
from film
group by rating

SELECT rating ,count(film_id)
from film
group by rating;

SELECT rating,rental_rate,count(film_id)
FROM film
GROUP BY rating,rental_rate;

SELECT DISTINCT rating,release_year
FROM film;

SELECT rating,release_year
FROM film
GROUP BY rating,release_year;

select distinct(rating),avg(rental_rate)
from film
group by rating;

select title,last_update
from film
where last_update between '2013-05-20' AND '2013-05-30'
limit 10;

select title,description
from film
where rating = 'PG' 
and rental_rate < 2;

select title,description
from film
where rating ='PG'
and NOT rental_rate < 2;


select title,description
from film
where rating = 'PG' 
or rental_rate < 2;

select title
from film
where title like '%Italian%';

select * 
from film
where rating IN ('PG','G','PG-13');

select store_id,count(film_id) as COUNT_Film
from inventory
group by store_id
having count(film_id) > 2300;


select title,rental_rate,rating,
	case 
	when rating = 'R' then 'under 10 years'
	when rating = 'PG' then '10 to 20 years'
	when rating = 'NC-17' then '20 to 40 years'
	when rating ='PG-13' then '40 to 60 years'
	else '60 + years'
	end 
	as Certificate 	
from film;

select rating,max(replacement_cost) as max_replacement_cost,min(replacement_cost) as min_replacement_cost
from film
group by rating
order by rating;


select film_id,title,description
from film
where title like '%Uptown%';

select film_id,title,description,length,rental_rate
from film
where length >120 and rental_rate > 2.99
order by film_id asc;

select film_id,title,description,replacement_cost
from film
where replacement_cost < 14.99;

select film_id,title,rating
from film
where rating IN ('PG','G');

select film_id,title,rental_duration
from film
where rental_duration between 4 and 6;


select count(film_id)as count_of_movies,
round(avg(rental_rate)) as average_rental_rate,
max(rental_duration) as max_rental_duration,
min(rental_duration) as min_rental_duration  	
from film
where rating = 'PG' or rating = 'G';



select title,
       release_year,
       language_id,
       rental_duration,
		count(*)>1
from film
group by title,
       release_year,
       language_id,
       rental_duration
having count(*)>1;


SELECT title,
       release_year,
       language_id,
       rental_duration
FROM film
GROUP BY title,
         release_year,
         language_id,
         rental_duration;
Here is the SQL syntax for selecting u


--Mode

Select mode() within group (order by rating)
as modal_value


select rating,count(*)
from film
group by rating
	order by count(*);
from film;

create or replace view english_movie
as
select film_id,title,rental_rate
from film
where film_id = 1;

select * from english_movie;


create or replace view hindi_movies
as
select film_id ,title,rental_rate
from film
where language_id = 2;

select * from hindi_movies;

select (language_id),title
from film
group by language_id,title;



CREATE VIEW  film_cantonese_view AS
SELECT * FROM film
WHERE language_id = 2 

SELECT *
FROM film_cantonese_view

 --task 3.6 Duplicates
select title,release_year,language_id,rental_duration,count(*)
from film
group by title,release_year,language_id,rental_duration
having count(*) >1

select customer_id,store_id,first_name,last_name,email,count(*)
from customer
group by customer_id,store_id,first_name,last_name,email
having count(*)>1;

--Non -Uniform

select distinct film_id,title,release_year,language_id,rental_duration,rental_rate,
length,replacement_cost,rating,last_update,special_features,fulltext
from film
order by film_id;

select distinct customer_id,store_id,first_name,last_name,email,address_id,activebool,create_date,last_update,active
from customer
order by customer_id;

select * 
from customer
group by customer_id
having count(*)>1;


---Missing values

select *
from film
where (film_id,title,release_year,language_id,rental_duration,rental_rate,
length,replacement_cost,rating,last_update,special_features,fulltext)
is null;

select *
from customer
where (customer_id,store_id,first_name,last_name,email,address_id,activebool,create_date,last_update,active)
is null;



--summarazing data


select film_id,round(avg(rental_rate)) as average_rental_rate,
max(rental_duration) as max_rental_duration,
min(rental_duration) as min_rental_duration  	
from film
group by film_id
order by max_rental_duration desc,average_rental_rate desc;


select count(film_id)as count_of_movies,
round(avg(rental_rate)) as average_rental_rate,
max(rental_duration) as max_rental_duration,
min(rental_duration) as min_rental_duration  	
from film;


select mode() within group (order by rating)
as modal_value
from film;



select count(customer_id) as count_customer,
count(store_id) as count_store,
max(address_id) as max_address_id,
min(address_id) as min_address_id,
max(active) as max_active,
min(active)as min_active
from customer;


select mode() within group (order by first_name)as modal_first_name,
 		mode() within group (order by last_name)as modal_last_name,
		mode() within group (order by email)as modal_email,
		mode() within group (order by activebool)as modal_activebool,
		mode() within group (order by create_date)as modal_create_date,
 		mode() within group (order by last_update)as modal_last_update
from customer;

select * from customer;


select * 
from language;

select f.film_id,f.title,f.release_year,l.name
from film f
join language l on
f.language_id = l.language_id
order by film_id desc;

select p.payment_id,p.customer_id,p.amount,c.first_name,c.last_name
from payment p
inner join customer c
on p.customer_id = c.customer_id;

select *
from customer;

select *
from country;

select *
from address ;

select * 
from city;

select *
from payment;


select s.staff_id,
		ct.country
from staff s
join address a 
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country ct
on c.country_id = ct.country_id;


select ct.country,count(c.customer_id) as  customer_number
from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id =ct.country_id
group by ct.country
order by customer_number desc
limit 5;




select ct.country,ci.city,count(c.customer_id) as  customer_number
from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id =ct.country_id
where
ct.country in (
select ct.country
from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id =ct.country_id
group by ct.country
order by count(c.customer_id) desc
limit 10
)
group by ct.country,ci.city
order by customer_number desc
limit 10;

----Top 5 customers with High amount
select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,ct.country,ci.city,sum(p.amount) as Highest_total_amount
from payment p
join customer c
on p.customer_id = c.customer_id
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ci.city in 
(select ci.city from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ct.country in 
(select ct.country from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country
order by count(c.customer_id) desc
limit 10)
group by ct.country,ci.city
order by count(c.customer_id) desc
limit 10)
GROUP BY c.customer_id,ct.country, ci.city
ORDER BY Highest_total_amount DESC
LIMIT 5; 


---most/least revenue

select f.title,sum(p.amount) as total_revenue
from payment p
join rental r
on p.rental_id = r.rental_id
join inventory i
on r.inventory_id = i.inventory_id
join film f
on i.film_id = f.film_id
group by f.film_id
order by total_revenue desc
limit 10;

select film_id ,avg(rental_duration) 
from film
group by film_id;

select c.name,round(avg(f.rental_duration),2) as avg_rental_duration
from film f
join film_category fc
on f.film_id =fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name
order by avg_rental_duration desc;


select ct.country, ci.city,count(c.customer_id) as count_of_customers
from customer c
join  address a
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ci.city,ct.country
order by count_of_customers desc
limit 10;


Select country.country,city.city, count(address.address_id) as customer_count
from customer
inner join address on customer.address_id=address.address_id
full join city on address.city_id=city.city_id
full join country on city.country_id=country.country_id
where country.country_id=44 or country.country_id=103 
	or country.country_id=23 or country.country_id=50 
	or country.country_id=60 or country.country_id=15 
	or country.country_id=80 or country.country_id=75 
	or country.country_id=97 or country.country_id=45
group by city.city, country.country
order by count(address.address_id) desc
limit 10;



select title,rating,release_year,
(select max(amount) from payment) as max_amount
from film;


/*the Rockbuster management team wants to know how many films are rated G, PG, or PG-13, and how many films are less than 100-minutes long*/

select rating,count(film_id)
from film
where rating in('G','PG','PG-13')
and length <= 100
group by rating;


SELECT COUNT(shortmovies.film_ID) AS short_movie_count,
shortmovies.rating
FROM
(SELECT film.film_ID,
film.rating
FROM film
WHERE film.length <=100) AS shortmovies -- subquery renamed shortmovies
WHERE shortmovies.rating IN ('G', 'PG', 'PG-13')
GROUP BY shortmovies.rating;



select avg (Highest_total_amount) from
(select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,ct.country,ci.city,sum(p.amount) as Highest_total_amount
from payment p
join customer c
on p.customer_id = c.customer_id
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ci.city in 
(select ci.city from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ct.country in 
(select ct.country from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country
order by count(c.customer_id) desc
limit 10)
group by ct.country,ci.city
order by count(c.customer_id) desc
limit 10)
GROUP BY c.customer_id,ct.country, ci.city
ORDER BY Highest_total_amount DESC
LIMIT 5) as total_amount_paid;




select ct.country,count(distinct c.customer_id) as all_customer_count,count(distinct top_5_customers.customer_id) as top_customer_count 
from customer c
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country ct ON ct.country_id = ci.country_id
left join
(select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,ct.country,ci.city,sum(p.amount) as Highest_total_amount
from payment p
join customer c
on p.customer_id = c.customer_id
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ci.city in 
(select ci.city from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ct.country in 
(select ct.country from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country
order by count(c.customer_id) desc
limit 10)
group by ct.country,ci.city
order by count(c.customer_id) desc
limit 10)
group by  c.customer_id,ct.country, ci.city
order by Highest_total_amount desc
limit 5)as top_5_customers on top_5_customers.country = ct.country
group by ct.country
order by top_customer_count desc; 

select ct.country,ci.city,count(c.customer_id) as customer_numbers
from customer c
join address a
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ct.country in 
(select ct.country 
from country ct
join city ci
on ct.country_id = ci.country_id
group by ct.country
order by ct.country desc
limit 10)
group by ct.country,ci.city
order by customer_numbers desc
limit 10;



with Top10_country(Country)
as
(select ct.country from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country
order by count(c.customer_id) desc
limit 10),
Top10_City
as
(select ci.city from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ct.country in (select * from Top10_country )),
Total_amount
as
(select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,ct.country,ci.city,sum(p.amount) as Highest_total_amount
from payment p
join customer c
on p.customer_id = c.customer_id
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ci.city in 
(select * from Top10_city)
GROUP BY c.customer_id,ct.country, ci.city
ORDER BY Highest_total_amount DESC
LIMIT 5)
select avg (Highest_total_amount) as Average
from Total_amount;




with Top10_country(Country)
as
(select ct.country from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country
order by count(c.customer_id) desc
limit 10),
Top10_City
as
(select ci.city from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
where ct.country in (select * from Top10_country )
group by ct.country, ci.city
order by count(c.customer_id) desc
Limit 10),
total_amount_paid as (
 select c.customer_id, ct.country, sum(P.amount) as total_amount_payment 
from payment p
inner join customer as c on C.customer_id = P.customer_id
inner join address as a on A.address_id = C.address_id
inner join city as ci on CI.city_id = A.city_id
inner join country as Ct on Ct.country_id = CI.country_id
 where CI.city in (select city from top10_city)
group by C.customer_id, Ct.country
 order by sum(p.amount) desc
 limit 5)
select ct.country,
 count(distinct C.customer_id) as all_customer_count,
 count(distinct T5.customer_id) as top_customer_count
from customer as c
inner join address as A on A.address_id = C.address_id
inner join city as ci on ci.city_id = a.city_id
inner join country as ct on ct.country_id = ci.country_id
left join total_amount_paid as T5 on T5.customer_id = C.customer_id and T5.country =
ct.country
group by Ct.country
order by all_customer_count desc



SELECT country,
COUNT(DISTINCT A.customer_id) AS customer_count,
SUM(amount) AS total_payment
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_ID = D.country_ID
INNER JOIN payment E ON a.customer_id = E.customer_id
GROUP BY country

select f.title,sum(p.amount) as total_revenue
from payment p
join rental r
on p.rental_id = r.rental_id
join inventory i
on r.inventory_id = i.inventory_id
join film f
on i.film_id = f.film_id
group by f.film_id
order by total_revenue desc
limit 10;

--sales based on regions/countries
select ct.country,sum(p.amount) as Total_revenue
from payment p
join customer c
on p.customer_id=c.customer_id
join address a
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country
order by Total_revenue desc
limit 10;


select ca.name ,ct.country,sum(p.amount) as Total_revenue 
from payment p
join rental r
on p.rental_id = r.rental_id
join inventory i
on r.inventory_id = i.inventory_id
join film_category fc
on i.film_id = fc.film_id
join category ca
on fc.category_id = ca.category_id
join customer c
on r.customer_id = c.customer_id
join address a
on c.address_id = 	a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id = ct.country_id
group by ct.country,ca.name
order by Total_revenue desc;



select ct.country,count(c.customer_id) as  customer_number
from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country ct
on ci.country_id =ct.country_id
group by ct.country
order by customer_number desc;
