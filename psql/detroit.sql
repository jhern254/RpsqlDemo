-- Demo data for PostgreSQL in R

CREATE TABLE detroit (
    FTP double precision,     --Full-time police per 100,000 population
    UEMP double precision,    --% unemployed in the population
    MAN double precision, 
    LIC double precision,
    GR double precision,
    CLEAR double precision,
    WM integer,
    NMAN double precision,
    GOV double precision,
    HE double precision,
    WE double precision,
    HOM double precision,
    ACC double precision,
    ASR double precision

);

-- Copy import from detroit.csv
COPY detroit   --relation copied into
FROM '/home/jun/Documents/Programming/RProjects/RpsqlDemo/data/detroit.csv'
WITH (FORMAT CSV, HEADER);

-- Test query
SELECT * FROM detroit;













