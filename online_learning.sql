CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Tag (
    tag_id INT PRIMARY KEY,
    tag_name VARCHAR(50)
);




CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    instructor_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);




CREATE TABLE Course_Tag (
    course_id INT,
    tag_id INT,
    PRIMARY KEY (course_id, tag_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);



CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    enroll_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);




CREATE TABLE Module (
    module_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);



CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    rating INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);




CREATE TABLE Student_Phone (
    phone_id INT PRIMARY KEY,
    student_id INT,
    phone VARCHAR(15),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);




CREATE TABLE Lesson (
    lesson_id INT PRIMARY KEY,
    module_id INT,
    title VARCHAR(100),
    FOREIGN KEY (module_id) REFERENCES Module(module_id)
);



CREATE TABLE Progress (
    student_id INT,
    lesson_id INT,
    status VARCHAR(20),
    PRIMARY KEY (student_id, lesson_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson(lesson_id)
);


INSERT INTO Instructor VALUES (1,'Juhi'),(2,'Alice'),(3,'Nayan');

INSERT INTO Student VALUES 
(1,'Sam','sam@gmail.com',CURRENT_TIMESTAMP),
(2,'Riya','riya@gmail.com',CURRENT_TIMESTAMP),
(3,'Arjun','arjun@gmail.com',CURRENT_TIMESTAMP),
(4,'Neha','neha@gmail.com',CURRENT_TIMESTAMP),
(5,'Rahul','rahul@gmail.com',CURRENT_TIMESTAMP);


INSERT INTO Course VALUES 
(1,'DBMS',1,CURRENT_TIMESTAMP),
(2,'Java',2,CURRENT_TIMESTAMP),
(3,'Python',3,CURRENT_TIMESTAMP);


INSERT INTO Module VALUES 
(1,1,'Basics'),
(2,1,'Advanced'),
(3,2,'OOP'),
(4,3,'Intro');


INSERT INTO Lesson VALUES 
(1,1,'Intro DB'),
(2,1,'ER Model'),
(3,2,'Normalization'),
(4,3,'Classes'),
(5,4,'Syntax');


INSERT INTO Enrollment VALUES 
(1,1,CURRENT_DATE),
(2,1,CURRENT_DATE),
(3,2,CURRENT_DATE),
(4,3,CURRENT_DATE),
(5,2,CURRENT_DATE);


INSERT INTO Review VALUES 
(1,1,1,5,'Good',CURRENT_TIMESTAMP),
(2,2,1,4,'Nice',CURRENT_TIMESTAMP),
(3,3,2,5,'Excellent',CURRENT_TIMESTAMP);


INSERT INTO Progress VALUES 
(1,1,'Completed'),
(1,2,'Completed'),
(2,1,'In Progress'),
(3,3,'Completed');


INSERT INTO Tag VALUES 
(1,'Tech'),
(2,'Programming');


INSERT INTO Course_Tag VALUES 
(1,1),
(2,2),
(3,2);

INSERT INTO Student_Phone VALUES 
(1,1,'9999999999'),
(2,1,'8888888888'),
(3,2,'7777777777');


SELECT * FROM Student;


SELECT * FROM Course;


SELECT student_id, course_id FROM Enrollment;

SELECT title, instructor_id FROM Course;

SELECT Student.name, Course.title
FROM Enrollment
JOIN Student ON Enrollment.student_id = Student.student_id
JOIN Course ON Enrollment.course_id = Course.course_id;


SELECT Course.title, Instructor.name
FROM Course
JOIN Instructor ON Course.instructor_id = Instructor.instructor_id;
