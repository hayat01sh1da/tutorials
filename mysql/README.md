## 1. Environment

- WSL (Ubuntu 25.10)
- Docker 29.3.1
- mysql/mysql-server:8.0.32

## 2. Reference

[MySQL Tutorial - W3Schools](https://www.w3schools.com/mysql/default.asp)

## 3. Docker

### 3-1. Setup MySQL

```bash
$ docker build
$ docker-compose up -d
```

### 3-2. Create DB, Tables and Insert Records

```bash
$ docker-compose exec db mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.32 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> source setup.sql
```

## 4. SQL Introduction

### 4-1. List Up Databases

```bash
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sql_tutorial       |
| sys                |
+--------------------+
```

### 4-2. Switch to a Specific Database

```sql
mysql> USE sql_tutorial;
Database changed
mysql> SHOW TABLES;
+------------------------+
| Tables_in_sql_tutorial |
+------------------------+
| Categories             |
| Customers              |
| Employees              |
| OrderDetails           |
| Orders                 |
| Products               |
| Shippers               |
| Suppliers              |
+------------------------+
```

### 4-3. Check Schema of a Specific Table

```sql
mysql> DESCRIBE Employees;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | YES  |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| BirthDate | date         | YES  |     | NULL    |       |
| Photo     | varchar(255) | YES  |     | NULL    |       |
| Notes     | longtext     | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
```

### 4-4. Fetch a Specific Column

You can use `*` if you would like to fetch all columns.

```sql
mysql> SELECT ID FROM Employees;
+----+
| ID |
+----+
|  1 |
|  2 |
|  3 |
|  4 |
|  5 |
|  6 |
|  7 |
|  8 |
|  9 |
+----+
```

## 5. Schemas

### 5-1. Categories

|Field       |Type         |Null |Key |Default |Extra |
|:-----------|:------------|:----|:---|:-------|:-----|
|ID          |int          |NO   |PRI |NULL    |      |
|Name        |varchar(255) |YES  |    |NULL    |      |
|Description |varchar(255) |YES  |    |NULL    |      |

### 5-2. Customers

|Field       |Type         |Null |Key |Default |Extra |
|:-----------|:------------|:----|:---|:-------|:-----|
|ID          |int          |NO   |PRI |NULL    |      |
|FullName    |varchar(255) |YES  |    |NULL    |      |
|ContactName |varchar(255) |YES  |    |NULL    |      |
|Address     |varchar(255) |YES  |    |NULL    |      |
|City        |varchar(255) |YES  |    |NULL    |      |
|ZipCode     |varchar(255) |YES  |    |NULL    |      |
|Country     |varchar(255) |YES  |    |NULL    |      |

### 5-3. Employees

|Field     |Type         |Null |Key |Default |Extra |
|:---------|:------------|:----|:---|:-------|:-----|
|ID        |int          |NO   |PRI |NULL    |      |
|LastName  |varchar(255) |YES  |    |NULL    |      |
|FirstName |varchar(255) |YES  |    |NULL    |      |
|BirthDate |date         |YES  |    |NULL    |      |
|Photo     |varchar(255) |YES  |    |NULL    |      |
|Notes     |longtext     |YES  |    |NULL    |      |

### 5-4. Orders

|Field      |Type |Null |Key |Default |Extra |
|:----------|:----|:----|:---|:-------|:-----|
|ID         |int  |NO   |PRI |NULL    |      |
|OrderDate  |date |YES  |    |NULL    |      |
|CustomerID |int  |YES  |MUL |NULL    |      |
|EmployeeID |int  |YES  |MUL |NULL    |      |
|ShipperID  |int  |YES  |MUL |NULL    |      |

### 5-5. OrderDetails

|Field     |Type |Null |Key |Default |Extra |
|:---------|:----|:----|:---|:-------|:-----|
|ID        |int  |NO   |PRI |NULL    |      |
|Quantity  |int  |YES  |    |NULL    |      |
|OrderID   |int  |YES  |MUL |NULL    |      |
|ProductID |int  |YES  |MUL |NULL    |      |

### 5-6. Products

|Field      |Type         |Null |Key |Default |Extra |
|:----------|:------------|:----|:---|:-------|:-----|
|ID         |int          |NO   |PRI |NULL    |      |
|Name       |varchar(255) |YES  |    |NULL    |      |
|Unit       |varchar(255) |YES  |    |NULL    |      |
|Price      |float        |YES  |    |NULL    |      |
|CategoryID |int          |YES  |MUL |NULL    |      |
|SupplierID |int          |YES  |MUL |NULL    |      |

### 5-7. Shippers

|Field |Type         |Null |Key |Default |Extra |
|:-----|:------------|:----|:---|:-------|:-----|
|ID    |int          |NO   |PRI |NULL    |      |
|Name  |varchar(255) |YES  |    |NULL    |      |
|Phone |varchar(255) |YES  |    |NULL    |      |

### 5-8. Suppliers

|Field       |Type         |Null |Key |Default |Extra |
|:-----------|:------------|:----|:---|:-------|:-----|
|ID          |int          |NO   |PRI |NULL    |      |
|Name        |varchar(255) |YES  |    |NULL    |      |
|ContactName |varchar(255) |YES  |    |NULL    |      |
|Address     |varchar(255) |YES  |    |NULL    |      |
|City        |varchar(255) |YES  |    |NULL    |      |
|ZipCode     |varchar(255) |YES  |    |NULL    |      |
|Country     |varchar(255) |YES  |    |NULL    |      |
|Phone       |varchar(255) |YES  |    |NULL    |      |
