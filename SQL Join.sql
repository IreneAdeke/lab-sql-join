use sakila;

# 1. List the number of films per category.
select * from film_category;  
select * from film; 

select count(film_id) as number_films,
category_id from film_category
group by category_id; 

# 2. Display the first and the last names, as well as the address, of each staff member.
select * from staff; 
select * from address; 

select s.first_name,s.last_name, a.address
from staff as s
left join address as a on (s.address_id=a.address_id);
 

# 3. Display the total amount rung up by each staff member in August 2005.
select * from staff; 
select * from payment; 

select staff_id, sum(amount) from payment
where payment_date like "2005-08%"
group by staff_id; 


# 4. List all films and the number of actors who are listed for each film.
select * from film; 
select * from film_actor; 

select f.title, count(fa.actor_id) as number_actors
from film as f
join film_actor as fa on(f.film_id=fa.film_id)
group by f.title;

# 5. Using the payment and the customer tables as well as the JOIN command, 
#list the total amount paid by each customer. 
# List the customers alphabetically by their last names.
select * from payment; 
select * from customer; 

select p.customer_id, first_name, last_name, sum(amount) as total_amount
from payment as p
join customer c on p.customer_id = c.customer_id
group by customer_id
order by last_name asc; 
