
CREATE TABLE student (
    school varchar(10),
    sex varchar(5),
    age smallint,
    address varchar(10),
    famsize varchar(10),
    Pstatus varchar(5),
    Medu smallint,
    Fedu smallint,
    mjob varchar(20),
    fjob varchar(20),
    reason varchar(30),
    guardian varchar(20),
    traveltime smallint,
    studytime smallint,
    failures smallint,
    schoolsup boolean,
    famsup boolean,
    paid boolean,
    activities boolean,
    nursery boolean,
    higher boolean,
    internet boolean,
    romantic boolean,
    famrel smallint,
    freetime smallint,
    goout smallint,
    Dalc smallint,
    Walc smallint,
    health smallint,
    absences smallint,
    G1 smallint, 
    G2 smallint,
    G3 smallint

);

-- Import data
COPY student
FROM '/home/jun/Documents/Programming/RProjects/RpsqlDemo/data/student-mat.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ';');

-- Test query
SELECT * FROM student;


















