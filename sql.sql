create table books
(
	title text,
	Price float,
	Star varchar(10),
	category varchar(30),
	availability INT
);

select * from books

-- copy books(title, Price, Star, category, availability)
-- from 'D:\mywork\Web_scraping\books\books1'
-- Delimiter ','
-- csv header;

-- Set 1 (Easy)

/* Q1. Retrieve all books that have a price less than 30. */

select * from books
where Price < 30

/* Q2. Count the number of books available in each category */

select category , count(*) as total_books
from books
group by category;

/* Q3. List all unique star ratings in the dataset */

select distinct star
from books;

-- Set 2 (Moderate)
/* Q1. Find the average price of books grouped by category. */

select category, avg(price) as average_price
from books
group by category

/* Q2. Retrieve the top 5 most expensive books. */

select title, price 
from books
order by price desc
limit 5;

/* Q3. Count how many books have the word "Python" in the title */

select count(*) as Python_Book_Count
from books
where title like '%Python%';

-- Set 3 (Advance)

/* Q1. Find the category with the highest total price of books. */

select category, sum(price) as total_price
from books
group by category
order by total_price desc
limit 1;

/* Q8.	List all books where availability mentions more than 20 items */

select * 
from books
where availability > 20;

/* Q9.	Get the average price of books for each star rating, ordered from highest to lowest. */

select  star, avg(price) as average_price
from books
group by star
order by average_price desc;

/* Q10.	Identify the books with the maximum price in each category */

select b.*
from books b
join(
	select category, max(price) as max_price
	from books
	group by category
) as max_category
on b. category = max_category.category and b.price = max_category.max_price;
