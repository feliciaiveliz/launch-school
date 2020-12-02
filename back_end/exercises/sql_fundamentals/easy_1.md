### Easy 1

1. Create a database

```sql
createdb animals
```

or 

```sql
CREATE DATABASE animals;
```

---

2. Create a table

```sql
CREATE TABLE birds (
id serial PRIMARY KEY,
name varchar(25),
age integer,
species varchar(15)
);
```

---

3. Insert Data

```sql
INSERT INTO birds
VALUES ('Charlie', '3', 'Finch'),
('Allie', '5', 'Owl'), 
('Jennifer', '3', 'Magpie'), 
('Jamie', '4', 'Owl'), 
('Roy', '8', 'Crow');
```

or 

```sql
INSERT INTO birds (name, age, species) VALUES ('Charlie', 3, 'Finch');
INSERT INTO birds (name, age, species) VALUES ('Allie', 5, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Jennifer', 3, 'Magpie');
INSERT INTO birds (name, age, species) VALUES ('Jamie', 4, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Roy', 8, 'Crow');
```

---

4. Select Data

```sql
SELECT * FROM birds;
```

or

```sql
SELECT name, age, species FROM birds;
```

---

5. WHERE Clause

```sql
SELECT * FROM birds WHERE age < 5;
```

---

6. Update Data

```sql
UPDATE birds SET species = 'Raven'
  WHERE species = 'Crow';
```

```sql
UPDATE birds SET species = 'Hawk'
  WHERE species = 'Owl';
```

---

7. Delete Data

```sql
DELETE FROM birds WHERE age = 3 AND species = 'Finch';
```

---
8. Add Constraint

```sql
ALTER TABLE birds ADD CONSTRAINT check_age (age>0);
INSERT INTO birds (age, name, species) VALUES (-2, 'Bubbles', 'Cardinal');
```

or

```sql
ALTER TABLE birds ADD CHECK (age>0);
```

---

9. Drop Table

```sql
DROP TABLE IF EXISTS birds;
```

or for specifying more than one table:

```sql
DROP TABLE birds, reptiles; 
```