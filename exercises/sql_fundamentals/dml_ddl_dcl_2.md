## DML/DDL/DCL

DML/DDL/DCL Part 1

1. Does the following statement use the Data Definition Language (DDL) or the Data Manipulation Language (DML) component of SQL?

```sql
SELECT column_name FROM my_table;
```

Answer: DML. `SELECT` is used to query or read data in a database.

---

2. Does the following statement use the DDL or DML component of SQL?

```sql
CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
```

Answer: DDL. `CREATE` is used to manipulate the data definitions.

---

3. Does the following statement use the DDL or DML component of SQL?

```sql
ALTER TABLE things
DROP CONSTRAINT things_item_key;
```

Answer: DDL. `ALTER` is used to maniplate the structure of a table.

---
