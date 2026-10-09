Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS UniversityDB;
Query OK, 1 row affected (0.04 sec)

mysql> USE UniversityDB;
Database changed
mysql> CREATE TABLE Departments (
    -> DepartmentID INT PRIMARY KEY,
    -> DepartmentName VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> CREATE TABLE Students (
    -> StudentID INT PRIMARY KEY,
    -> FirstName VARCHAR(50),
    -> LastName VARCHAR(50),
    -> Email VARCHAR(100),
    -> BirthDate DATE,
    -> EnrollmentDate DATE
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE Courses (
    -> CourseID INT PRIMARY KEY,
    -> CourseName VARCHAR(100),
    -> DepartmentID INT,
    -> Credits INT,
    -> FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE Instructors (
    -> InstructorID INT PRIMARY KEY,
    -> FirstName VARCHAR(50),
    -> LastName VARCHAR(50),
    -> Email VARCHAR(100),
    -> DepartmentID INT,
    -> Salary DECIMAL(10,2),
    -> FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Enrollments (
    -> EnrollmentID INT PRIMARY KEY,
    -> StudentID INT,
    -> CourseID INT,
    -> EnrollmentDate DATE,
    -> FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    -> FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Departments VALUES (1, 'Computer Science'), (2, 'Mathematics');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Students VALUES (1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Courses VALUES (101, 'Introduction to SQL', 1, 3),(102, 'Data Structures', 2, 4);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Instructors VALUES (1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 80000),(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 70000);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Enrollments VALUES(1, 1, 101, '2022-08-01'),(2, 2, 102, '2021-08-01');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Departments VALUES (3, 'Physics');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students VALUES (3, 'Mike', 'Brown', 'mike.brown@email.com', '2001-03-10', '2023-08-01');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Courses VALUES (103, 'Calculus', 2, 4);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Instructors VALUES (3, 'Carol', 'White', 'carol.white@univ.com', 3, 65000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Enrollments VALUES (3, 3, 103, '2023-08-01');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Departments;
+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
|            3 | Physics          |
+--------------+------------------+
3 rows in set (0.01 sec)

mysql> SELECT * FROM Students;
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-05-25 | 2021-08-01     |
|         3 | Mike      | Brown    | mike.brown@email.com | 2001-03-10 | 2023-08-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Courses;
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
|      103 | Calculus            |            2 |       4 |
+----------+---------------------+--------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Instructors;
+--------------+-----------+----------+------------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 80000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 70000.00 |
|            3 | Carol     | White    | carol.white@univ.com   |            3 | 65000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Enrollments;UPDATE Departments SET DepartmentName = 'Applied Physics' WHERE DepartmentID = 3;
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      103 | 2023-08-01     |
+--------------+-----------+----------+----------------+
3 rows in set (0.00 sec)

Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Students SET Email = 'mike.b@email.com' WHERE StudentID = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Courses SET Credits = 5 WHERE CourseID = 103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Instructors SET Salary = 68000 WHERE InstructorID = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Enrollments SET EnrollmentDate = '2023-08-15' WHERE EnrollmentID = 3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Enrollments WHERE EnrollmentID = 3;
Query OK, 1 row affected (0.01 sec)

mysql> DELETE FROM Instructors WHERE InstructorID = 3;
Query OK, 1 row affected (0.00 sec)

mysql> DELETE FROM Courses WHERE CourseID = 103;
Query OK, 1 row affected (0.00 sec)

mysql> DELETE FROM Students WHERE StudentID = 3;
Query OK, 1 row affected (0.00 sec)

mysql> DELETE FROM Departments WHERE DepartmentID = 3;
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Students WHERE YEAR(EnrollmentDate) > 2022;
Empty set (0.01 sec)

mysql> SELECT c.*
    -> FROM Courses c
    -> JOIN Departments d ON c.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = 'Mathematics'
    -> LIMIT 5;
+----------+-----------------+--------------+---------+
| CourseID | CourseName      | DepartmentID | Credits |
+----------+-----------------+--------------+---------+
|      102 | Data Structures |            2 |       4 |
+----------+-----------------+--------------+---------+
1 row in set (0.01 sec)

mysql> SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS TotalStudents
    -> FROM Courses c
    -> JOIN Enrollments e ON c.CourseID = e.CourseID
    -> GROUP BY c.CourseID, c.CourseName
    -> HAVING COUNT(e.StudentID) > 5;
Empty set (0.02 sec)

mysql> SELECT s.StudentID, s.FirstName, s.LastName
    -> FROM Students s
    -> JOIN Enrollments e ON s.StudentID = e.StudentID
    -> JOIN Courses c ON e.CourseID = c.CourseID
    -> WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
    -> GROUP BY s.StudentID, s.FirstName, s.LastName
    -> HAVING COUNT(DISTINCT c.CourseName) = 2;
Empty set (0.01 sec)

mysql> SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
    -> FROM Students s
    -> JOIN Enrollments e ON s.StudentID = e.StudentID
    -> JOIN Courses c ON e.CourseID = c.CourseID
    -> WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
+-----------+-----------+----------+
2 rows in set (0.00 sec)

mysql> SELECT AVG(Credits) AS AvgCredits FROM Courses;
+------------+
| AvgCredits |
+------------+
|     3.5000 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(i.Salary) AS MaxSalary
    -> FROM Instructors i
    -> JOIN Departments d ON i.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = 'Computer Science';
+-----------+
| MaxSalary |
+-----------+
|  80000.00 |
+-----------+
1 row in set (0.01 sec)

mysql> SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS TotalStudents
    -> FROM Departments d
    -> LEFT JOIN Courses c ON d.DepartmentID = c.DepartmentID
    -> LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
    -> GROUP BY d.DepartmentID, d.DepartmentName;
+------------------+---------------+
| DepartmentName   | TotalStudents |
+------------------+---------------+
| Computer Science |             1 |
| Mathematics      |             1 |
+------------------+---------------+
2 rows in set (0.01 sec)

mysql> SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
    -> FROM Students s
    -> INNER JOIN Enrollments e ON s.StudentID = e.StudentID
    -> INNER JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+-----------+----------+---------------------+
| StudentID | FirstName | LastName | CourseName          |
+-----------+-----------+----------+---------------------+
|         1 | John      | Doe      | Introduction to SQL |
|         2 | Jane      | Smith    | Data Structures     |
+-----------+-----------+----------+---------------------+
2 rows in set (0.01 sec)

mysql> SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
    -> FROM Students s
    -> LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
    -> LEFT JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+-----------+----------+---------------------+
| StudentID | FirstName | LastName | CourseName          |
+-----------+-----------+----------+---------------------+
|         1 | John      | Doe      | Introduction to SQL |
|         2 | Jane      | Smith    | Data Structures     |
+-----------+-----------+----------+---------------------+
2 rows in set (0.00 sec)

mysql> SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
    -> FROM Students s
    -> JOIN Enrollments e ON s.StudentID = e.StudentID
    -> WHERE e.CourseID IN (
    ->     SELECT CourseID
    ->     FROM Enrollments
    ->     GROUP BY CourseID
    ->     HAVING COUNT(StudentID) > 10
    -> );
Empty set (0.01 sec)

mysql> SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear
    -> FROM Students;
+-----------+-----------+----------+----------------+
| StudentID | FirstName | LastName | EnrollmentYear |
+-----------+-----------+----------+----------------+
|         1 | John      | Doe      |           2022 |
|         2 | Jane      | Smith    |           2021 |
+-----------+-----------+----------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT InstructorID, CONCAT(FirstName, ' ', LastName) AS FullName
    -> FROM Instructors;
+--------------+---------------+
| InstructorID | FullName      |
+--------------+---------------+
|            1 | Alice Johnson |
|            2 | Bob Lee       |
+--------------+---------------+
2 rows in set (0.00 sec)

mysql> SELECT EnrollmentDate,
    ->        COUNT(StudentID) AS StudentsEnrolled,
    ->        SUM(COUNT(StudentID)) OVER (ORDER BY EnrollmentDate) AS RunningTotal
    -> FROM Enrollments
    -> GROUP BY EnrollmentDate;
+----------------+------------------+--------------+
| EnrollmentDate | StudentsEnrolled | RunningTotal |
+----------------+------------------+--------------+
| 2021-08-01     |                1 |            1 |
| 2022-08-01     |                1 |            2 |
+----------------+------------------+--------------+
2 rows in set (0.01 sec)

mysql> SELECT StudentID, FirstName, LastName, EnrollmentDate,
    ->        CASE
    ->            WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4 THEN 'Senior'
    ->            ELSE 'Junior'
    ->        END AS StudentLabel
    -> FROM Students;
+-----------+-----------+----------+----------------+--------------+
| StudentID | FirstName | LastName | EnrollmentDate | StudentLabel |
+-----------+-----------+----------+----------------+--------------+
|         1 | John      | Doe      | 2022-08-01     | Junior       |
|         2 | Jane      | Smith    | 2021-08-01     | Senior       |
+-----------+-----------+----------+----------------+--------------+
2 rows in set (0.00 sec)