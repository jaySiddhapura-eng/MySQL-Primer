CREATE TABLE student(
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL ,
    major VARCHAR(20) DEFAULT 'undefined',
    PRIMARY KEY(student_id)
);

DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(4,2) DEFAULT(00.00);
ALTER TABLE student ADD DOB DATE;

ALTER TABLE student DROP COLUMN gpa;

ALTER TABLE student DROP COLUMN DOB;

INSERT INTO student(name,major) VALUES ('person1','major1');
INSERT INTO student(name,major) VALUES ('person2','major2');
INSERT INTO student(name,major) VALUES ('person3','major3');
INSERT INTO student(name,major) VALUES ('person4','major4');

SELECT * FROM student;


/*update and delete*/

/*basic update statement*/
UPDATE student              /*which table to update*/
SET major = 'science'       /*what to set = value*/
WHERE major = 'major1';     /*which entry to update*/

UPDATE student
SET name = 'jay'
WHERE name = 'person1';

UPDATE student
SET major = 'computer science'
WHERE major = 'science';

UPDATE student
SET name = 'andy'
WHERE name ='person2';

UPDATE student
SET major = 'special education'
WHERE major = 'major2';

UPDATE student
SET major = 'special education'
WHERE major = 'major4';

UPDATE student
SET name = 'micha'
WHERE name = 'person4';


/*You can update one value value by accessing the entry by their other element*/
UPDATE student
SET gpa = '80.80'           /*update the gpa*/
WHERE student_id = '1';     /*whose student_id is 1*/

UPDATE student
SET gpa = '90.90'           /*update the gpa*/
WHERE name = 'andy';        /*whose name is andy */



UPDATE student
SET name = 'andy'
Where name = 'person3';

UPDATE student
SET major = 'sepcial education'
WHERE major ='major3';


/*set multiple things*/
UPDATE student
SET name = 'jerry', major = 'cheese making'
WHERE student_id = 2 ; 


UPDATE student
SET name = 'lugie'
WHERE name = 'MICHA';

/*set perticular thing with multiple condition*/
UPDATE student
SET name = 'micha'
WHERE student_id = 4 AND  name = 'lugie';

UPDATE student
SET gpa = '50.50'
WHERE name = 'luigie';

UPDATE student
SET gpa = '40.37'
WHERE name = 'micha';

INSERT INTO student (name,major,gpa) VALUES('person5','no education','30.30');

/*delete the entire table */
DELETE FROM student;

/*delete multiple whose one of the element is same*/
DELETE FROM student
WHERE name = 'person5'; /*this will delete all the entry with name person5*/

/*delete specific entry*/
DELETE FROM student
WHERE name = 'person5' AND student_id = 8;

/*to select entire table*/
SELECT * FROM student;


/*select from table*/

/*select perticular data from table*/
/*select the name and gpa column from table*/
SELECT name, gpa
FROM student;

/*you can order your result according to the given field*/
/*by default order is assending*/
SELECT name, gpa
FROM student
ORDER BY gpa ASC;

/*to make it descending order*/
SELECT student.name, student.gpa
FROM student
ORDER BY gpa DESC;

/*obtaining certain number of results*/
/*just need 3 results*/
SELECT student.name, student.gpa
FROM student
ORDER BY gpa ASC    /*bottom three student*/
LIMIT 3;

/*select specific student with specific data*/
/*select the student whose gpa is above 30 and bellow 80*/
SELECT student.name, student.gpa
FROM student
WHERE gpa > '30.00' AND gpa < '80.00'
ORDER BY gpa ASC;

/*In statement to exactly searching the data*/
/*find a person whose name is jerry and micha*/
/*and sort them in asscending order*/
SELECT student.name, student.gpa
FROM student
WHERE name IN ('jerry','micha')
ORDER BY gpa ASC;

