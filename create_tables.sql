-- ==========================================
-- SQL DDL Statements
-- ==========================================

-- ==========================================
-- RESET (Drop tables in reverse order of dependency)
-- ==========================================
DROP TABLE IF EXISTS belegt CASCADE;
DROP TABLE IF EXISTS fuehrt CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS instructor CASCADE;

-- ==========================================
-- CREATE Tables (in order of dependency)
-- ==========================================

CREATE TABLE Student (
    student_id   INT,
    first_name   VARCHAR(255)  NOT NULL,
    last_name    VARCHAR(255)  NOT NULL,
    email        VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT PK_Student primary key (student_id)
);

CREATE TABLE Instructor (
    instructor_id INT,
    first_name    VARCHAR(255)  NOT NULL,
    last_name     VARCHAR(255)  NOT NULL,
    email         VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT PK_Instructor primary key (instructor_id)
);

CREATE TABLE Course (
    course_id     INT,
    title         VARCHAR(255) NOT NULL,
    credits       INT NOT NULL CHECK (credits > 0),
	CONSTRAINT PK_Course primary key (course_id)
);

CREATE TABLE Fuehrt (
    instructor_id INT NOT NULL,
    course_id     INT NOT NULL,
    CONSTRAINT PK_Fuehrt primary key (course_id),
    CONSTRAINT FK_Instructor FOREIGN KEY (instructor_id)
		REFERENCES Instructor(instructor_id),
	CONSTRAINT FK_Course FOREIGN KEY (course_id)
		REFERENCES Course(course_id)
);

CREATE TABLE belegt (
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    CONSTRAINT PK_Belegt primary key (student_id, course_id),
    CONSTRAINT FK_Student FOREIGN KEY (student_id)
		REFERENCES Student(student_id),
	CONSTRAINT FK_Course FOREIGN KEY (course_id)
		REFERENCES Course(course_id)
);