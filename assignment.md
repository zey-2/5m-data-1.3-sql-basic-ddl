# Assignment

## Brief

Write the SQL statements for the following questions.

## Instructions

Paste the answer as SQL in the answer code section below each question.

### Question 1

Write the SQL statement to create a unique index on the `email` column of the `students` table in the `lesson` schema.

Answer:

```sql
CREATE TABLE lesson.students (
  id integer primary KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  address VARCHAR,
  phone VARCHAR,
  email VARCHAR CHECK(CONTAINS(email, '@')), -- check
  class_id INTEGER REFERENCES lesson.classes(id)
);
```

### Question 2

Write the SQL statement to alter the `teachers` table in the `lesson` schema to add a new column `subject` of type `VARCHAR`.

Answer:

```sql
ALTER TABLE lesson.teachers ADD COLUMN subject VARCHAR;
```

### Question 3

Write the SQL statement to update the `email` of the teacher with the name 'John Doe' to 'john.doe@school.com' in the teachers table of the `lesson` schema.

Answer:

```sql
UPDATE lesson.teachers
SET email = 'john.doe@school.com'
WHERE name = 'John Doe';
```

## Submission

- Submit the URL of the GitHub Repository that contains your work to NTU black board.
- Should you reference the work of your classmate(s) or online resources, give them credit by adding either the name of your classmate or URL.
