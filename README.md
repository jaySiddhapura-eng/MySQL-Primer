# MySQL Database Primer

------

## What is CRUD operations?

​	**C** create [create the new database entry]

​	**R** read  [ reading the data from database]

​	**U** update [update the existing data in database ]

​	**D** delete [ delete the data in database]

​	This are the four operations which are performed on any particular database

## Types of database

1. Relational Database [SQL]

   1. Data organization in tables

   2. Raw columns 

   3. Unique key identifies rows 

   4. Like excel spreadsheets 

   5. **RDBMS** helps user maintain the SQL[relational database]

   6. **SQL** [structured query language] is the language used to perform CRUD operations on DB

      

2. Non-Relational [NoSQL / not just SQL]

   1. Non table format database

   2. JSON, XML

   3. Flexible table

   4. NRDBMS helps user maintain the NoSQL database

   5. NoSQL example. [mongo DB, dynamo DB, apache Cassandra, firebase etc.]

   6. So specific SQL language, SQL language is implementation varies DB to DB

## What is Database Queries?

   1. Queries are requests made to the DBMS for specific piece of information

   2. As DB become more complex, hard to get the specific piece of info.

## Core Concepts in RDB [relational database]

 1. Row X Column [R = attributes , C = values]
 
 2. C = single attribute . R = Entry
 
 3. **Primary key** 
   
    1. Special column
	
    2. That attribute of the column will represents the primary key
	
    3. Can be consider as token for each entry [generally UID is primary key]
	
    4. <u>User can provide primary key and retrieve the corresponding data</u>
	
    5. Unique entry, no same value between two entries
	
4. **Surrogate key**

    1. Does not hold any real world importance<br>
	
    2. But necessary to represent the entry inside the database [example UID]
	
5. **Natural key** 

    1. A key which used in data base to uniquely identify the entry
    
    2. Also the same key holds real world importance
    
    3. Example: database entry with social security number
    
6. **Foreign key**

    1. **Map the row or entry** in one table to the other table
    
    2. Example: one data base with branch ID column - there is one more database which has branch ID related data so by using branch ID 	 of one database operator can go to another database
    
    3. This key can be used to define the **relationship between tables/database**
    
    4. Possibility of having **more than 1 foreign key** for one entry
    
    5. Foreign key can **hold the reference to the another entry** in the same data table
    
7. **Composite key**

    1. Composite key needs two attributes
    
    2. To uniquely identify each raw, you need both the keys of composite key
    
    3. No individual key of composite key can identify that particular row

## How to Create Table in MySQL?

 1. Before you start querying the data first thing we have to do is to make table 

 2. **Table is the first and foremost thing** to do after creating database

 3. Defining **DATABASE SCHEMA** is the first thing you have to do after creating the database

 4. DATABASE SCHEMA  is nothing but a process of defining the tables

 5. For example name of the table, different field of the table etc

 6. **To create** the table

    ~~~mysql
    		CREATE TABLE student(
    		student_id INT PRIMARY KEY,
    		name VARCHAR(20),
    		major VARCHAR(20)
    		);
    ~~~

 7. Capital letters are the SQL syntax

     1.	student is the name of table<br>
 8. Following are the common **data types**

    ~~~mysql
    		integerVaraiable INT
    		StringVariable VARCHAR(20) /*20 is capacity of String in terms of char*/
    		decimalNumbers DECIMAL(20,3)  
    		/*20 is digit capacity before decimal pt. */
    		/*3 is digit capacity before decimal pt.*/
    		photo BLOB NOT NULL,
    		/*photos can be stored as blob*/
    		birthDate DATE NOT NULL,
    ~~~

 9. To **see** the entire table [This command will only show the **DATABASE / TABLE schema**]

    ~~~mysql
    		DESCRIBE student; /* student is the name of table*/
    ~~~

 10. To delete the entire table

     ~~~mysql
     		DROP TABLE STUDENT;
     ~~~

 11. To add new column in the table [adding new schema in the table]

     ~~~mysql
     		ALTER TABLE student ADD gpa DECIMAL(3,2);
     		/*New column name gpa added in the table
       		The data type of this new column will be DECIMAL*/
     ~~~

 12. To delete certain column in the table[deleting certain schema in the table]

     ~~~mysql
     		ALTER TABLE student DROP COLUMN gpa;
     		/*same DROP command is used to delete column*/
     ~~~

## Inserting the data in the newly created TABLE

 1. The table is created in previous section

 2. How to insert the attributes into the table individually

    ~~~mysql
    		INSERT INTO student VALUES(1, 'Jake', 'biology', '85.90');
    		INSERT INTO student VALUES(2, 'Kate', 'sociology', '80.90');
    	
    		/*when one of the attriute of entry is not available and
    		you need to enter the entry anyway*/
    		INSERT INTO student(student_id,name) VALUES(3,'keke');
    ~~~

 3. How to view the created table with data in it

    ~~~mysql
    		SELECT * FROM student;
    ~~~

## Constrains which you can put on the column while creating the table

 1. **NOT NULL** : gives the rule while creating table that 'the attribute for that column should never be null'

 2. **UNIQUE**: gives the rule while creating table that 'the attribute for that column should always be unique'

 3. **DEFAULT**: In case data is not available for that particular column then default value is assigned

    ~~~mysql
    		CREATE TABLE student(
        		student_id INT PRIMARY KEY,
        		name VARCHAR(20) NOT NULL ,
        		major VARCHAR(20) UNIQUE 
    		);
    		ALTER TABLE student ADD gpa DECIMAL(4,2) DEFAULT(00.00);
    ~~~

 4. **AUTO_INCREMENT**: Perform auto increment on the primary key. If you put auto_increment on primary key then you don’t have to incremental primary key element 
    With every insert statement. 

    ~~~mysql
    		CREATE TABLE student(
    		    student_id INT AUTO_INCREMENT,
    		    name VARCHAR(20) NOT NULL ,
    		    major VARCHAR(20) DEFAULT 'undefined',
    		    PRIMARY KEY(student_id)
    		);
    		INSERT INTO student(name,major) VALUES ('person1','major1');
    		INSERT INTO student(name,major) VALUES ('person2','major2');
    		INSERT INTO student(name,major) VALUES ('person3','major3');
    		INSERT INTO student(name,major) VALUES ('person4','major4');
    ~~~

    Output table: Table1

    | student_id |  name   | major  | gpa  |
    | :--------: | :-----: | :----: | :--: |
    |     1      | person1 | major1 | 0.00 |
    |     2      | person2 | major2 | 0.00 |
    |     3      | person3 | major3 | 0.00 |
    |     4      | person4 | major4 | 0.00 |

    Note: Student_id is not mentioned in the Insert statement. But due to auto_increment student id increases by one with each new entry

## Update and delete the entries

 1. Basic update statement 

    ~~~mysql
    		/*basic update statement*/
    		UPDATE student              /*which table to update*/
    		SET major = 'science'       /*what to set = value*/
    		WHERE major = 'major1';     /*which entry to update*/
    ~~~

 2. Update one info. of the entry by specifying other info of the entry

    ~~~mysql
    		UPDATE student
    		SET gpa = '80.80'           /*update the gpa*/
    		WHERE student_id = '1';     /*whose student_id is 1*/
    		
    		UPDATE student
    		SET gpa = '90.90'           /*update the gpa*/
    		WHERE name = 'andy';        /*whose name is andy */
    ~~~

 3. Update multiple things of one entry

    Note: Update two information [name and major] whose student id is 2

    ~~~mysql
    		/*set multiple things*/
    		UPDATE student
    		SET name = 'jerry', major = 'cheese making'
    		WHERE student_id = 2 ; 
    ~~~

 4. Update one thing of one entry but to identify that entry use two information

    Note: Set the name to Micha for the entry whose student_id is 4 and name is lugie

    ~~~mysql
    		/*set perticular thing with multiple condition*/
    		UPDATE student
    		SET name = 'micha'
    		WHERE student_id = 4 AND  name = 'lugie';
    ~~~

 5. Delete entire table

    ~~~mysql
    		DELETE FROM student;
    ~~~

 6. Delete particular entry

    ~~~mysql
    		/*delete multiple whose one of the element is same*/
    		DELETE FROM student
    		WHERE name = 'person5'; /*this will delete all the entry with name person5*/
    ~~~

 7. Delete specific entry which has some same element [conditional delete]

    ~~~mysql
    		/*delete specific entry*/
    		DELETE FROM student
    		WHERE name = 'person5' AND student_id = 8;
    ~~~

## [Basic Queries] Getting Information from Database

 1. **SELECT** statement

    ~~~mysql
    		/*to select entire table*/
    		SELECT * FROM student;
    ~~~

 2. SELECT table **COLUMN** wise

    ~~~mysql
    		/*select perticular data from table*/
    		/*select the name and gpa column from table*/
    		SELECT name, gpa
    		FROM student;
    ~~~

 3. Perform the queries to get the data in **ORDER**

    ~~~mysql
    		/*you can order your result according to the given field*/
    		/*by default order is assending*/
    		SELECT name, gpa
    		FROM student
    		ORDER BY gpa ASC;
    		/*to make it descending order*/
    		SELECT student.name, student.gpa
    		FROM student
    		ORDER BY gpa DESC;
    ~~~

 4. Obtain the result in **limited numbers**[not entire table]

    ~~~mysql
    		/*obtaining certain number of results*/
    		/*just need 3 results*/
    		SELECT student.name, student.gpa
    		FROM student
    		ORDER BY gpa ASC    /*bottom three student*/
    		LIMIT 3;
    ~~~

 5. **Select** member [student] with **specific criteria**

    ~~~mysql
    		/*select specific student with specific data*/
    		/*select the student whose gpa is above 30 and bellow 80*/
    		SELECT student.name, student.gpa
    		FROM student
    		WHERE gpa > '30.00' AND gpa < '80.00'
    		ORDER BY gpa ASC;
    ~~~

 6. **In statement** to search the data

    ~~~mysql
    		/*In statement to exactly searching the data*/
    		/*find a person whose name is jerry and micha*/
    		/*and sort them in asscending order*/
    		SELECT student.name, student.gpa
    		FROM student
    		WHERE name IN ('jerry','micha')
    		ORDER BY gpa ASC;
    ~~~

 7. **Counting** 

    ~~~mysql
    		/*function*/
    		/*counting*/
    		SELECT COUNT(emp_id)
    		FROM employee;
    		/*it will count number of emp_id presents in table employee*/
    ~~~

## Links

 1. repository: https://github.com/jaySiddhapura-eng/MySQL

 2. Sample company database: https://github.com/jaySiddhapura-eng/MySQL/blob/master/sampleOrgTable.sql

 3. Tool which is being used: https://popsql.com/pricing 

 4. MySQL community server: https://dev.mysql.com/downloads/mysql/ 

    

    

    
