<div align="center">

# 🎓 University Database Management System

**A hands-on MySQL project in relational database design, data management, and analytical SQL.**

![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-336791)
![Project Type](https://img.shields.io/badge/Project-Database%20Management-2E8B57)

</div>

---

## 📌 Project Overview

The **University Database Management System** models core university information and demonstrates how SQL can be used to create related tables, manage records, and answer data questions. The database contains departments, students, courses, instructors, and course enrollments.

This project highlights practical SQL skills including **table design, primary and foreign keys, CRUD operations, joins, aggregate functions, subqueries, date functions, conditional logic, and window functions**. The screenshots in this README document the commands and their outputs from the supplied MySQL session.

## 🎯 Project Objectives

- Design a relational database for a university scenario.
- Connect related records using primary-key and foreign-key relationships.
- Practise inserting, reading, updating, and deleting records.
- Retrieve insights using filtering, joins, grouping, aggregate functions, and subqueries.
- Present query outputs as visual evidence of the work.

## 🧰 Tech Stack

- **Database:** MySQL
- **Query language:** SQL
- **Environment shown in screenshots:** MySQL command-line client
- **Version note:** MySQL 8.0+ is recommended for the window-function example.

## 🗂️ Database Tables

| Table | Purpose | Key relationships |
|---|---|---|
| `Departments` | Stores department IDs and names. | Referenced by `Courses` and `Instructors` |
| `Students` | Stores student names, email, birth date, and enrollment date. | Connected to courses through `Enrollments` |
| `Courses` | Stores course names, department IDs, and credits. | References `Departments`; referenced by `Enrollments` |
| `Instructors` | Stores instructor details and salary. | References `Departments` |
| `Enrollments` | Records which student enrolled in which course and on what date. | References `Students` and `Courses` |

## 🗺️ Entity Relationship Diagram

```mermaid
erDiagram
    DEPARTMENTS ||--o{ COURSES : offers
    DEPARTMENTS ||--o{ INSTRUCTORS : employs
    STUDENTS ||--o{ ENROLLMENTS : registers
    COURSES ||--o{ ENROLLMENTS : includes

    DEPARTMENTS {
        INT DepartmentID PK
        VARCHAR DepartmentName
    }
    STUDENTS {
        INT StudentID PK
        VARCHAR FirstName
        VARCHAR LastName
        VARCHAR Email
        DATE BirthDate
        DATE EnrollmentDate
    }
    COURSES {
        INT CourseID PK
        VARCHAR CourseName
        INT DepartmentID FK
        INT Credits
    }
    INSTRUCTORS {
        INT InstructorID PK
        VARCHAR FirstName
        VARCHAR LastName
        VARCHAR Email
        INT DepartmentID FK
        DECIMAL Salary
    }
    ENROLLMENTS {
        INT EnrollmentID PK
        INT StudentID FK
        INT CourseID FK
        DATE EnrollmentDate
    }
```

## 📊 Project Workflow

```mermaid
flowchart TD
    A([🚀 Start]) --> B[Create UniversityDB]
    B --> C[Create 5 related tables]
    C --> D[Define primary and foreign keys]
    D --> E[Insert sample records]
    E --> F[Run CRUD operations]
    F --> G[Execute analytical SQL queries]
    G --> H[Review result sets and screenshots]
    H --> I([✅ End])

    classDef startEnd fill:#e8f5e9,stroke:#2e7d32,color:#173d1d,stroke-width:2px;
    classDef process fill:#eaf2ff,stroke:#356ac3,color:#142d4e,stroke-width:1.5px;
    class A,I startEnd;
    class B,C,D,E,F,G,H process;
```

## 💡 SQL Concepts Demonstrated

| Concept | Examples from the project |
|---|---|
| Database and table design | `CREATE DATABASE`, `CREATE TABLE` |
| Referential integrity | `PRIMARY KEY`, `FOREIGN KEY` |
| CRUD operations | `INSERT`, `SELECT`, `UPDATE`, `DELETE` |
| Filtering and limiting | `WHERE`, `IN`, `YEAR()`, `LIMIT` |
| Joins | `INNER JOIN`, `LEFT JOIN` |
| Grouping and group filters | `GROUP BY`, `HAVING`, `COUNT()`, `COUNT(DISTINCT ...)` |
| Aggregate functions | `AVG()`, `MAX()` |
| Subqueries | Nested `SELECT` with `IN` and `HAVING` |
| Text and date functions | `CONCAT()`, `YEAR()`, `TIMESTAMPDIFF()`, `CURDATE()` |
| Conditional logic | `CASE ... WHEN ... THEN ... ELSE ... END` |
| Window functions | Running totals with `SUM(...) OVER (ORDER BY ...)` |

## 🖼️ Screenshots & Query Evidence

The screenshots below use **relative paths** inside the repository, so GitHub can display them when the `ss` folder is uploaded alongside this README.

### 1. 🏗️ Database Setup and CRUD

<table>
  <tr>
    <td width="50%"><strong>1. Create database and tables</strong><br><img src="ss/01.create database tables.png" alt="Create the UniversityDB database and tables" width="100%"></td>
    <td width="50%"><strong>2. Read table data</strong><br><img src="ss/02-read-table-data.png" alt="Select and display table records" width="100%"></td>
  </tr>
  <tr>
    <td colspan="2"><strong>3. Update and delete records</strong><br><img src="ss/03-update-delete-records.png" alt="Update and delete sample university records" width="100%"></td>
  </tr>
</table>

### 2. 🔎 Filtering and Course Queries

<table>
  <tr>
    <td width="50%"><strong>4. Students enrolled after 2022</strong><br><img src="ss/04-students-enrolled-after-2022.png" alt="Filter students by enrollment year" width="100%"></td>
    <td width="50%"><strong>5. Mathematics department courses (limit 5)</strong><br><img src="ss/05-mathematics-department-courses.png" alt="Find courses in Mathematics department" width="100%"></td>
  </tr>
  <tr>
    <td><strong>6. Courses with more than five students</strong><br><img src="ss/06-courses-with-more-than-five-students.png" alt="Group enrollments and filter with HAVING" width="100%"></td>
    <td><strong>7. Students enrolled in both courses</strong><br><img src="ss/07-students-in-both-courses.png" alt="Find students enrolled in both named courses" width="100%"></td>
  </tr>
  <tr>
    <td><strong>8. Students enrolled in either course</strong><br><img src="ss/08-students-in-either-course.png" alt="Find students enrolled in either named course" width="100%"></td>
    <td><strong>9. Average course credits</strong><br><img src="ss/09-average-course-credits.png" alt="Calculate average credits across courses" width="100%"></td>
  </tr>
</table>

### 3. 📈 Aggregations, Joins, and Subqueries

<table>
  <tr>
    <td width="50%"><strong>10. Maximum Computer Science instructor salary</strong><br><img src="ss/10-max-cs-instructor-salary.png" alt="Find the maximum salary in Computer Science" width="100%"></td>
    <td width="50%"><strong>11. Students enrolled in each department</strong><br><img src="ss/11-students-per-department.png" alt="Count students by department" width="100%"></td>
  </tr>
  <tr>
    <td><strong>12. INNER JOIN</strong><br><img src="ss/12-inner-join.png" alt="Join students with their enrolled courses" width="100%"></td>
    <td><strong>13. LEFT JOIN</strong><br><img src="ss/13-left-join.png" alt="Use left joins to retrieve students and course names" width="100%"></td>
  </tr>
  <tr>
    <td colspan="2"><strong>14. Subquery</strong><br><img src="ss/14-subquery.png" alt="Subquery that filters courses by enrollment count" width="100%"></td>
  </tr>
</table>

### 4. 🧠 Date Functions, Text, and Window Logic

<table>
  <tr>
    <td width="50%"><strong>15. Extract enrollment year</strong><br><img src="ss/15-extract-enrollment-year.png" alt="Extract the year from EnrollmentDate" width="100%"></td>
    <td width="50%"><strong>16. Concatenate instructor names</strong><br><img src="ss/16-concatenate-instructor-name.png" alt="Combine first and last name with CONCAT" width="100%"></td>
  </tr>
  <tr>
    <td><strong>17. Running total of enrollments</strong><br><img src="ss/17-running-total-enrollments.png" alt="Calculate cumulative student enrollments with a window function" width="100%"></td>
    <td><strong>18. Senior / Junior labels</strong><br><img src="ss/18-senior-junior-labels.png" alt="Classify students using CASE and TIMESTAMPDIFF" width="100%"></td>
  </tr>
</table>

## ▶️ How to Run

1. Install **MySQL 8.0 or later** and start the MySQL server.
2. Open MySQL Workbench or the MySQL command-line client.
3. Review `UniversityDB.sql` and execute the SQL statements in your database session.
4. Run the queries individually to inspect their results.

> **Important:** The supplied `UniversityDB.sql` is a terminal transcript: it contains MySQL prompts such as `mysql>` / `->` and displayed output rows in addition to SQL statements. It is **not a clean, directly executable SQL script as-is**. Remove those prompts and output blocks before running the file as a script, or copy only the SQL statements into your SQL editor. The examples also insert and later delete the sample record with ID `3`, so later queries reflect the remaining records. Queries that return an empty set do so for the sample data and filters used in this exercise.

## 📁 Repository Structure

```text
UniversityDB_Project/
├── README.md
├── UniversityDB.sql
└── ss/
    ├── 01-create-database-tables.png
    ├── 02-read-table-data.png
    ├── 03-update-delete-records.png
    ├── 04-students-enrolled-after-2022.png
    ├── 05-mathematics-department-courses.png
    ├── 06-courses-with-more-than-five-students.png
    ├── 07-students-in-both-courses.png
    ├── 08-students-in-either-course.png
    ├── 09-average-course-credits.png
    ├── 10-max-cs-instructor-salary.png
    ├── 11-students-per-department.png
    ├── 12-inner-join.png
    ├── 13-left-join.png
    ├── 14-subquery.png
    ├── 15-extract-enrollment-year.png
    ├── 16-concatenate-instructor-name.png
    ├── 17-running-total-enrollments.png
    └── 18-senior-junior-labels.png
```

## 🌱 What This Project Demonstrates

This project provides practical evidence of relational data modelling and SQL query writing—from defining foreign-key relationships to using joins and analytical functions to answer questions about student enrollment, courses, departments, and instructors.

---

<div align="center">

**Thanks for checking out this project! 😊**

</div>
