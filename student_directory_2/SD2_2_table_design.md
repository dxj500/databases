Two Tables Design Recipe Template


1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.


Nouns:

student, name, cohort names, starting dates


2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

|    Record	     |        Properties           |
|----------------|-----------------------------|
|     student    |  name, starting date        |
|     cohort     |        name

Name of the first table (always plural): students

Column names: name, starting_date

Name of the second table (always plural): cohorts

Column names: name

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: students
id: SERIAL
name: text
starting_date: text

Table: cohorts
id: SERIAL
name: text


4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one students have many cohorts? NO
Can one cohort have many student? YES
You'll then be able to say that:

Cohorts has students
And on the other side, student belongs to cohort
In that case, the foreign key is in the table students
Replace the relevant bits in this example with your own:



4. Write the SQL.
-- EXAMPLE
-- file: students_table.sql

-- Create the table without the foreign key first.
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date text,
-- The foreign key name is always {other_table_singular}_id
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 student_directory_2 < students_table.sql