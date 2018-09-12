>1. Explain a subquery in your own words.

A subquery is a `SELECT` statement inside another `SELECT` statement. They can be easier to read than a `JOIN` and if done right, keeps duplicate rows from appearing in the result set. They can appear in the `SELECT`, `FROM` or `WHERE` clauses.

>2. Where can you use a subquery within a SELECT statement?

In the `SELECT`, `FROM` or `WHERE` clauses.

>3. When would you employ a subquery?

They can be used when you want to show information from multiple tables or even when you want to do some aggregation of data.

>4. Explain a row constructor in your own words.

I've never seen this before.  It looks like a function that allows you to hard code some values to mix in with table values into a result set. It kind of looks like the results come out in arrays.

>5. What happens if a row in the subquery result provides a `NULL` value to the comparison?

The result becomes `NULL` instead of `true`.

>6. What are the ways to use a subquery within a WHERE clause?

a. `WHERE EXISTS` = This returns results based on whether that part of the `WHERE` clause is `true` .
b. `WHERE NOT EXISTS` = This returns results based on whether that part of the `WHERE` clause is `false`.
c. `WHERE IN` = This returns results based on the values of one field within the subquery that matches the values of a field in the outer part of a `SELECT` statement. In order to produce a result set, there has to be at least one match.
d. `WHERE NOT IN` = This limits results based on matches of the values of a field in a subquery.
e. `WHERE ANY` or `WHERE SOME` = These are equivalent. If there are `ANY` or `SOME` matches, it's going to produce results.
f. `WHERE ALL` = In order for any results to be produce, there has to be a complete match on this `WHERE` condition.

>7. Using this [Adoption schema and data](https://www.db-fiddle.com/f/tpodLv3A43VL4gHqohqx2o/0), please write queries to retrieve the following information and include the results:

>- All volunteers. If the volunteer is fostering a dog, include each dog as well.

```SQL
SELECT
	vol.first_name
  ,vol.last_name
  ,d.name
FROM
	volunteers vol
  LEFT JOIN dogs d ON vol.foster_dog_id = d.id;
```

>- The cat's name, adopter's name, and adopted date for each cat adopted within the past month to be displayed as part of the "Happy Tail" social media promotion which posts recent successful adoptions.

```SQL
SELECT
	c.name
  ,a.first_name
  ,a.last_name
  ,ca.date
FROM
	cats c
  JOIN cat_adoptions ca ON c.id = ca.cat_id
  JOIN adopters a ON ca.adopter_id = a.id
```

>- Adopters who have not yet chosen a dog to adopt and generate all possible combinations of adopters and available dogs.

```SQL
SELECT
	*
FROM
	adopters a
  CROSS JOIN dogs d
WHERE
	a.id NOT IN (
  SELECT
  	da.adopter_id
  FROM
  	dog_adoptions da)
```

>- Lists of all cats and all dogs who have not been adopted.

```SQL
SELECT
	ROW(d.name,'Dog')
FROM
	dogs d
WHERE
	d.id NOT IN (
  SELECT
  	da.dog_id
  FROM
  	dog_adoptions da)

UNION

SELECT
	ROW(c.name, 'Cat')
FROM
	cats c
WHERE
	c.id NOT IN (
  SELECT
  	ca.cat_id
  FROM
  	cat_adoptions ca);
```

>- The name of the person who adopted Rosco.

```SQL
SELECT
	a.first_name
  ,a.last_name
FROM
	adopters a
  JOIN dog_adoptions da ON a.id = da.adopter_id
  JOIN dogs d ON da.dog_id = d.id
WHERE
	d.name = 'Rosco'
```

>8. Using [this Library schema and data](https://www.db-fiddle.com/f/j4EGoWzHWDBVtiYzB9ygC4/0), write queries applying the following scenarios, and include the results:


>- To determine if the library should buy more copies of a given book, please provide the names and position, in order, of all of the patrons with a hold (request for a book with all copies checked out) on "Advanced Potion-Making".

*Please note that there is no such field as `position` in the patron table in this db-fiddle so I'm not going to be able to give a `position`.*

```SQL
SELECT
	p.name
FROM
	patrons p
  JOIN (
  SELECT
  	h.patron_id
    ,h.isbn
  FROM
  	holds h) h ON p.id = h.patron_id
	JOIN (
  SELECT
  	b.isbn
  	,b.title
  FROM
  	books b) b ON h.isbn = b.isbn
WHERE
	b.title = 'Advanced Potion-Making'
ORDER BY
	p.name ASC
```

>- Make a list of all book titles and denote whether or not a copy of that book is checked out.

```SQL
SELECT
	b.title
  ,CASE
  WHEN t.checked_in_date IS NULL OR t.checked_in_date >= CURRENT_DATE THEN 'Checked in'
  ELSE 'Checked out'
  END
FROM
	books b
  LEFT JOIN (
  SELECT
  	t.isbn
  	,t.checked_in_date
  FROM
  	transactions t  
  GROUP BY
    	t.isbn
  	,t.checked_in_date
  ORDER BY
  	t.checked_in_date DESC
  LIMIT 1
  ) t ON b.isbn = t.isbn;
```

>- In an effort to learn which books take longer to read, the librarians would like you to create a list of average checked out time by book name in the past month.

```SQL
SELECT
	t.isbn
	,AVG(t.checked_in_date - t.checked_out_date) AS av
FROM
  transactions t
WHERE
  t.checked_in_date IS NOT NULL
  AND t.checked_out_date >= (CURRENT_DATE - INTERVAL '1 MONTH')
GROUP BY
  t.isbn;
```

>- In order to learn which items should be retired, make a list of all books that have not been checked out in the past 5 years.

```SQL
SELECT
	b.title

FROM
	books b
  JOIN (
  SELECT
  	t.isbn
  FROM
  	transactions t
  WHERE
  	t.checked_in_date IS NOT NULL
  	AND t.checked_in_date <= (CURRENT_DATE - INTERVAL '5 YEARS')
  ORDER BY
  	t.isbn
  LIMIT 1
  ) t ON b.isbn = t.isbn;
```

>- List all of the library patrons. If they have one or more books checked out, correspond the books to the patrons.

```SQL
SELECT
	p.name
  ,b.title
FROM
	patrons p
  LEFT JOIN transactions t ON p.id = t.patron_id
		AND t.checked_in_date IS NULL
  LEFT JOIN books b ON t.isbn = b.isbn
```

>9. Using [this Flight schema and data](https://www.db-fiddle.com/f/tyNDJ9M7QwZn6Y3SAxmK3M/0), write queries applying the following scenarios, and include the results:


>- To determine the most profitable airplanes, find all airplane models where each flight has had over 250 paying customers in the past month.

```SQL
SELECT
	f.airplane_model
FROM
	flights f
  JOIN transactions t ON f.flight_number = t.flight_number
WHERE
	t.seats_sold > 250
  AND t.date >= (CURRENT_DATE - INTERVAL '1 MONTH')
```

>- To determine the most profitable flights, find all destination-origin pairs where 90% or more of the seats have been sold in the past month.

```SQL
SELECT
	f.destination
  ,f.origin
FROM
	flights f
  JOIN airplanes a ON f.airplane_model = a.model
  JOIN transactions t ON f.flight_number = t.flight_number
WHERE
	a.seat_capacity / t.seats_sold >= .90
  AND t.date >= (CURRENT_DATE - INTERVAL '1 MONTH')
```

>- The airline is looking to expand its presence in Asia and globally. Find the total revenue of any flight (not time restricted) arriving at or departing from Singapore (SIN).

```SQL
SELECT
	t.flight_number
  ,f.company
  ,f.origin
  ,f.destination
	,t.total_revenue
FROM
	transactions t
  JOIN flights f ON t.flight_number = f.flight_number
WHERE
	f.origin = 'SIN'
  OR f.destination = 'SIN'
```

>10. Compare the subqueries you've written above. Compare them to the joins you wrote in Checkpoint 6. Which ones are more readable? Which were more logical to write?

I try and go with a `join` and time I can.  It gets too...unreadable... (or less readable) when I have to start using subqueries. I don't think one method trumps another. Sometimes it's more logical to me to write a subquery but most of the time I keep myself out of trouble when I don't have to write a subquery.

[Further reading...](https://wiki.postgresql.org/wiki/Performance_Optimization)
