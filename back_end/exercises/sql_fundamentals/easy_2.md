## DML/DDL/DCL

DML/DDL/DCL Part 1

1. DML: Data Manipulation Language
- It allows a user to modify or retrieve the data that is stored within a database. (CRUD) - Create, Read, Update, Delete.
- Two examples would be `INSERT` and `DELETE`.

2. DDL: Data Definition Language
- This language allows a user to create, modify and delete tables and databases. It is responsible for describing how data is structured.
- Two examples would be `CREATE`, and `ALTER`.

---

DML/DDL/DCL Part 2

```sql
SELECT column_name FROM my_table;
```

This statement uses the DML. `SELECT` queries (or reads) the data in a database. It manipulates the data, not the structure of the data.

---

DML/DDL/DCL Part 3

```sql
CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
```

This statement uses the DDL. Using `CREATE TABLE` allows us to define the type of information stored in a database table by describing the data and its attributes. It doesn't modify the data definitions.

---

DML/DDL/DCL Part 4

```sql
ALTER TABLE things
DROP CONSTRAINT things_item_key;
```

This statement uses the DDL. `ALTER TABLE` modifies the characters of a table. It manipulates the data definitions.

---

DML/DDL/DCL Part 5

```sql
INSERT INTO things VALUES (3, 'Scissors', 'Metal');
```

This statement uses DML. Using `INSERT INTO` allows us to add new rows of data into the database. This manipulates the data and not the structure of the data.

---

DML/DDL/DCL Part 6

```sql
UPDATE things
SET material = 'plastic'
WHERE item = 'Cup';
```

This statement uses DML. Using `UPDATE` allows us to update or change the value of a column for a table in the database. This manipulates the data and not the structure of the data.

---

DML/DDL/DCL Part 7

```sql
\d things
```

This statement uses DDL. Well, not really. It's not part of the SQL language since it is a `psql` console command. It most closely acts like a DDL statement, it displays the schema of the table. Think of it as a `DESCRIBE` statment.

---

DML/DDL/DCL Part 8

```sql
DELETE FROM things WHERE item = 'Cup';
```

This statement uses DML. `DELETE` statements delete the specified row of data from the table in the database. It manipulates the data and not the structure of the data.

---

DML/DDL/DCL Part 9

```sql
DROP DATABASE xyzzy;
```

This statement uses DDL. It's main purpose is to operate on data definitions. It removes all data from the database, including all tables tables.

---

DML/DDL/DCL Part 10

```sql
CREATE SEQUENCE part_number_sequence;
```

This statement uses DDL. `CREATE SEQUENCE` statements modify the characteristics and attributes of a database by adding a sequence object to the database structure. It doesn't manipulate data, but it manipulates data definitions.