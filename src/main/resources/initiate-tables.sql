DROP TABLE IF EXISTS school.course CASCADE;
DROP TABLE IF EXISTS school.group CASCADE;
DROP TABLE IF EXISTS school.student CASCADE;
DROP TABLE IF EXISTS school.student_course CASCADE;

DROP SCHEMA IF EXISTS school;

CREATE SCHEMA IF NOT EXISTS school;
SET search_path TO school, public;

CREATE TABLE IF NOT EXISTS school.course (
    ID SERIAL PRIMARY KEY,
    NAME TEXT,
    DESCRIPTION TEXT
);
CREATE TABLE IF NOT EXISTS school.group (
    ID SERIAL PRIMARY KEY,
    NAME TEXT
);
CREATE TABLE IF NOT EXISTS school.student (
    ID SERIAL PRIMARY KEY,
    GROUP_ID INT,
    FIRST_NAME TEXT,
    LAST_NAME TEXT,
    CONSTRAINT GROUP_ID_FK
    FOREIGN KEY (GROUP_ID)
    REFERENCES school.group (ID)
);
CREATE TABLE IF NOT EXISTS school.student_course (
    STUDENT_ID INT,
    COURSE_ID INT,
    CONSTRAINT STUDENT_ID_FK
    FOREIGN KEY (STUDENT_ID)
    REFERENCES student (ID)
    ON DELETE CASCADE,
    CONSTRAINT COURSE_ID_FK
    FOREIGN KEY (COURSE_ID)
    REFERENCES course (ID)
    ON DELETE CASCADE
);