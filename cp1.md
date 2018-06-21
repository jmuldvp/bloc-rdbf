Answers to checkpoint 1 questions within "Module 3: Software Engineering Principles - Relational Database Fundamentals"

*1. What data types do each of these values represent?*
a. "A Clockwork Orange" - `string`
b. 42 - `integer`
c. 09/02/1945 - `date` in SQL Server but could also be `string`.
d. 98.7 - `float`
e. $15.99 - `string`

*2. Explain in your own words when a database might be used. Explain when a text file might be used.*
a. A database would be used to store someone's contact information or even basic information like Amazon or FaceBook does.
b. A text file might be used to store information about a current session within a browser that could change the look and feel depending on what the user is doing with the application.

*3. Describe one difference between SQL and other programming languages.*
SQL is declarative and other languages are (or can be) procedural. In a declarative language, the programmer must know the relationships.  In procedural languages, the programmer has to tell the computer what to do.

*4. In your own words, explain how the pieces of a database system fit together at a high level.*
A database can have one or many tables. Each table can be described like a spreadsheet where there are rows, columns and values. Tables can have relationships between them.

*5. Explain the meaning of table, row, column, and value.*
A table holds information about something. A well designed database will have information separated out where name information would go in one table and address information may go into one or more others. A table will have one or more columns and one or more (hopefully more than one) rows. Picture a spreadsheet. To explain a value, again picture a spreadsheet and look at one of the cells....whatever is in one cell is called a value.  If you inserted a times table into a DB table, if you look at the 3 column and go down to the fourth row, you may see the number 12 there if the times table was entered correctly.

*6. List 3 data types that can be used in a table.*
1. integer
2. float
3. object
4. date
5. bit
6. boolean
7. nvarchar
etc.

*7. Given this payments table, provide an English description of the following queries and include their results:*
```SQL
SELECT date, amount
FROM payments;
```
Give me the values of the date and amounts columns from the payments table.

```SQL
SELECT amount
FROM payments
WHERE amount > 500;
```
Give me the amount column from the payments table where the amount is greater than 500.

```SQL
SELECT *
FROM payments
WHERE payee = 'Mega Foods';
```
Give me all columns in the payments table where the payee value is 'Mega Foods'.

*8. Given this users table, write SQL queries using the following criteria and include the output:*
-The email and sign-up date for the user named DeAndre Data.
```SQL
SELECT
  email
  ,signup
FROM
  users
WHERE
  name = 'DeAndre Data';
```

-The user ID for the user with email 'aleesia.algorithm@uw.edu'.
```SQL
SELECT
  id
FROM
  users
WHERE
  email = 'aleesia.algorithm@uw.edu';
```

-All the columns for the user ID equal to 4.
```SQL
SELECT
  *
FROM
  users
WHERE
  id = 4;
```
