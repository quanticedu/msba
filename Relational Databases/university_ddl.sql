-- Create the schema and tables in a single code block
CREATE SCHEMA university;

CREATE TABLE university.classroom (
    building        VARCHAR(15),
    room_number     VARCHAR(7),
    capacity        INTEGER,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE university.department (
    dept_name       VARCHAR(20), 
    building        VARCHAR(15), 
    budget          NUMERIC(12,2) CHECK (budget > 0),
    PRIMARY KEY (dept_name)
);

CREATE TABLE university.course (
    course_id       VARCHAR(8), 
    title           VARCHAR(50), 
    dept_name       VARCHAR(20),
    credits         INTEGER CHECK (credits > 0),
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES university.department (dept_name)
        ON DELETE SET NULL
);

CREATE TABLE university.instructor (
    ID              VARCHAR(5), 
    name            VARCHAR(20) NOT NULL, 
    dept_name       VARCHAR(20), 
    salary          NUMERIC(8,2) CHECK (salary > 29000),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES university.department (dept_name)
        ON DELETE SET NULL
);

CREATE TABLE university.section (
    course_id       VARCHAR(8), 
    sec_id          VARCHAR(8),
    semester        VARCHAR(6) CHECK (semester IN ('Fall', 'Winter', 'Spring', 'Summer')), 
    year            INTEGER CHECK (year > 1701 AND year < 2100), 
    building        VARCHAR(15),
    room_number     VARCHAR(7),
    time_slot_id    VARCHAR(4),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES university.course (course_id)
        ON DELETE CASCADE,
    FOREIGN KEY (building, room_number) REFERENCES university.classroom (building, room_number)
        ON DELETE SET NULL
);

CREATE TABLE university.teaches (
    ID              VARCHAR(5), 
    course_id       VARCHAR(8),
    sec_id          VARCHAR(8), 
    semester        VARCHAR(6),
    year            INTEGER,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES university.section (course_id, sec_id, semester, year)
        ON DELETE CASCADE,
    FOREIGN KEY (ID) REFERENCES university.instructor (ID)
        ON DELETE CASCADE
);

CREATE TABLE university.student (
    ID              VARCHAR(5), 
    name            VARCHAR(20) NOT NULL, 
    dept_name       VARCHAR(20), 
    tot_cred        INTEGER CHECK (tot_cred >= 0),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES university.department (dept_name)
        ON DELETE SET NULL
);

CREATE TABLE university.takes (
    ID              VARCHAR(5), 
    course_id       VARCHAR(8),
    sec_id          VARCHAR(8), 
    semester        VARCHAR(6),
    year            INTEGER,
    grade           VARCHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES university.section (course_id, sec_id, semester, year)
        ON DELETE CASCADE,
    FOREIGN KEY (ID) REFERENCES university.student (ID)
        ON DELETE CASCADE
);

CREATE TABLE university.advisor (
    s_ID            VARCHAR(5),
    i_ID            VARCHAR(5),
    PRIMARY KEY (s_ID),
    FOREIGN KEY (i_ID) REFERENCES university.instructor (ID)
        ON DELETE SET NULL,
    FOREIGN KEY (s_ID) REFERENCES university.student (ID)
        ON DELETE CASCADE
);

CREATE TABLE university.time_slot (
    time_slot_id    VARCHAR(4),
    day             VARCHAR(1),
    start_hr        INTEGER CHECK (start_hr >= 0 AND start_hr < 24),
    start_min       INTEGER CHECK (start_min >= 0 AND start_min < 60),
    end_hr          INTEGER CHECK (end_hr >= 0 AND end_hr < 24),
    end_min         INTEGER CHECK (end_min >= 0 AND end_min < 60),
    PRIMARY KEY (time_slot_id, day, start_hr, start_min)
);

CREATE TABLE university.prereq (
    course_id       VARCHAR(8), 
    prereq_id       VARCHAR(8),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES university.course (course_id)
        ON DELETE CASCADE,
    FOREIGN KEY (prereq_id) REFERENCES university.course (course_id)
);
