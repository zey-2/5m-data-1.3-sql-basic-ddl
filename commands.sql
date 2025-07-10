CREATE SCHEMA IF NOT EXISTS lesson;

CREATE TABLE lesson.users (
	id INTEGER,
	name VARCHAR,
	email VARCHAR
	);

INSERT INTO lesson.users (id, name, email)
VALUES (1, 'John', 'john.doe@gmail.com')

INSERT INTO lesson.users (id, name, email)
VALUES (2, 'John', 'john.doe@gmail.com'),(3, 'Jeoy', 'joey@gmail.com');

DROP TABLE lesson.users;

--------------------------------------------------------------

CREATE TABLE lesson.teachers (
  id integer primary KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  age INTEGER CHECK(age > 18 AND age < 70), -- check
  address VARCHAR,
  phone VARCHAR,
  email VARCHAR CHECK(CONTAINS(email, '@')) -- check
);

CREATE TABLE lesson.teachers(id INTEGER PRIMARY KEY,
"name" VARCHAR NOT NULL,
age INTEGER,
address VARCHAR,
phone VARCHAR,
email VARCHAR,
CHECK(((age > 18) AND (age < 70))),
CHECK(contains(email, '@')));

CREATE TABLE lesson.classes (
  id INTEGER PRIMARY KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  teacher_id INTEGER REFERENCES lesson.teachers(id) -- foreign key
);

CREATE TABLE lesson.students (
  id integer primary KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  address VARCHAR,
  phone VARCHAR,
  email VARCHAR CHECK(CONTAINS(email, '@')), -- check
  class_id INTEGER REFERENCES lesson.classes(id)
);

DROP TABLE lesson.teachers;

INSERT INTO lesson.teachers (id, name, age, address, phone, email)
VALUES (1, 'Alice Tan', 35, '123 Orchard Road', '91234567', 'alice.tan@example.com'),
(2, 'Alice Tan', 35, '123 Orchard Road', '91234567', null);

SELECT * FROM lesson.teachers;

-- Create a unique index 'teachers_name_idx' on the column name of table teachers.
CREATE UNIQUE INDEX teachers_name_idx ON lesson.teachers(name);
-- Create index 'students_name_idx' that allows for duplicate values on the column name of table students.
CREATE INDEX students_name_idx ON lesson.students(name);

DROP INDEX lesson.teachers_name_idx;
DROP INDEX lesson.students_name_idx;

SELECT * FROM duckdb_indexes();

desc lesson.students;


ALTER TABLE lesson.classes ADD COLUMN start_date DATE;

ALTER TABLE lesson.classes RENAME name TO code;
ALTER TABLE lesson.teachers ADD COLUMN subject VARCHAR;

CREATE VIEW lesson.students_view AS
SELECT id, name, email
FROM lesson.students;


COPY lesson.classes FROM 'C:\Users\ernes\Dropbox\zhihao\NTU_DS_AI\github\5m-data-1.3-sql-basic-ddl\data\classes.csv' (AUTO_DETECT TRUE);

INSERT INTO lesson.teachers (id, name, age, address, phone, email)
VALUES (1, 'Alice Tan', 35, '123 Orchard Road', '91234567', 'alice.tan@example.com'),
       (2, 'Bob Lee', 40, '456 River Valley', '98765432', 'bob.lee@example.com');

COPY lesson.classes(id, name, teacher_id) 
FROM 'C:/Users/ernes/Dropbox/zhihao/NTU_DS_AI/github/5m-data-1.3-sql-basic-ddl/data/classes.csv' 
(AUTO_DETECT TRUE);

UPDATE lesson.teachers
SET email = 'linda.g@example.com'
WHERE id = 2;

COPY (SELECT * FROM lesson.teachers) TO 'C:\Users\ernes\Dropbox\zhihao\NTU_DS_AI\github\5m-data-1.3-sql-basic-ddl\data\teachers_new.csv' WITH (HEADER 1, DELIMITER ',');

COPY (SELECT * FROM lesson.teachers) TO 'C:\Users\ernes\Dropbox\zhihao\NTU_DS_AI\github\5m-data-1.3-sql-basic-ddl\data\teachers.json';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY'
  AND table_schema = 'lesson';
