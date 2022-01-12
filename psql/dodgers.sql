-- Demo data for PostgreSQL in R

CREATE TABLE dodgers (
    month varchar(20),
    day smallint,
    attend int,
    day_of_week varchar(20),
    opponent varchar(30),
    temp smallint,
    skies varchar(30),
    day_night varchar(10),
    cap varchar(10),
    shirt varchar(10),
    fireworks varchar(10),
    bobblehead varchar(10)  -- These are all bools, but YES/NO messes up 

);

-- Copy import from dodgers.csv
COPY dodgers   --relation copied into
FROM '/home/jun/Documents/Programming/RProjects/RpsqlDemo/data/dodgers.csv'
WITH (FORMAT CSV, HEADER);
-- This worked w/ ^M separators, which is Windows newline

-- Test query
SELECT * FROM dodgers;










