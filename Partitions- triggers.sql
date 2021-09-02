-- Create Partiotions table_productions 

CREATE TABLE table_1950_1970(
	CHECK (startyear>='1950' AND startyear<'1970' )
) INHERITS(production) ;

CREATE TABLE table_1970_1999
	CHECK (startyear >= '1970' AND startyear <'1999')
) INHERITS (production) ;


CREATE TABLE table_1930_1950
	CHECK (startyear >= '1930' AND startyear <'1950')
) INHERITS (production) ;


CREATE TABLE table_2010_2020
	CHECK (startyear >= '2010' AND startyear <'2020')
) INHERITS (production) ;


CREATE TABLE table_1999_2010
	CHECK (startyear >= '1999' AND startyear <'2010')
) INHERITS (production) ;


CREATE TABLE table_1874_1930
	CHECK (startyear >= '1874' AND startyear <'1930')
) INHERITS (production) ;

--Partitions indexes

create index table_1874_1930_index ON table_1874_1930(startyear)
create index table_1930_1950_index ON table_1930_1950(startyear)
create index table_1950_1970_index ON table_1950_1970(startyear)
create index table_1970_1999_index ON table_1970_1999(startyear)
create index table_1999_2010_index ON table_1999_2010(startyear)
create index table_2010_2020_index ON table_2010_2020(startyear)

--Trigger 


BEGIN 
	IF ( cast(NEW.startyear as INT) .+ 1874 AND 
		cast (NEW.startyear as INT) < 1930 ) THEN 
		INSERT INTO table_1874_1930 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as INT) >= 1874 AND 
		cast (NEW.startyear as INT) < 1930 ) THEN 
		INSERT INTO table_1874_1930 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as INT) >= 1874 AND 
		cast (NEW.startyear as INT) < 1930 ) THEN 
		INSERT INTO table_1874_1930 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as INT) >= 1874 AND 
		cast (NEW.startyear as INT) < 1930 ) THEN 
		INSERT INTO table_1874_1930 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as INT) >= 1874 AND 
		cast (NEW.startyear as INT) < 1930 ) THEN 
		INSERT INTO table_1874_1930 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as INT) >= 1874 AND 
		cast (NEW.startyear as INT) < 1930 ) THEN 
		INSERT INTO table_1874_1930 VALUES (NEW.*);
	ELSE 
		RAISE EXCEPTION 'Date out of range. Fix the measurement_insert _trigger() function!';
	END IF;
	RETURN NULL;
END; 

DROP TRIGGER IF EXISTS trigger_production on production;
CREATE TRIGGER trigger-production
BEFORE INSERT ON production
FOR EACH ROW EXECUTE PROCEDURE measurement_insert_trigger();

--Explain partition 

explain select genres, startyear, endyear, count(*)
from production where genrs like '%Action%' and startyear>='1990'
and endyear <='2010' group by genres, startyear, endyear

--Creating Partition for table Rating 

drop table if exists table_0_25;
create table table_0_25 (
	check (
		cast (avgrating as FLOAT) >=0
	and
		cast (avgrating as FLOAT)<2.5
	)
) inherits (ratings) ;

drop table if exists table_25_50;
create table table_25_50 (
	check (
		cast (avgrating as FLOAT) >=2.51
	and
		cast (avgrating as FLOAT)<5.0
	)
) inherits (ratings) ;

drop table if exists table_50_75;
create table table_50_75 (
	check (
		cast (avgrating as FLOAT) >=5
	and
		cast (avgrating as FLOAT)<7.5
	)
) inherits (ratings) ;

drop table if exists table_75_10;
create table table_75_10 (
	check (
		cast (avgrating as FLOAT) >=7.5
	and
		cast (avgrating as FLOAT)<10
	)
) inherits (ratings) ;


--partition indexes (ratings)

create index table_0_25_index on table_0_25(avgrating)
create index table_25_50_index on table_25_50(avgrating)
create index table_50_75_index on table_50_75(avgrating)
create index table_75_10_index on table_75_10(avgrating)

--trigger 

CREATE OR REPLACE FUNCTION ratings_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN 
	IF ( cast(NEW.startyear as FLOAT)>=0 and
		cast (NEW.startyear as FLOAT) < 2.5 ) then 
		INSERT INTO table_0_25 values (NEW.*);
	ELSIF ( cast(NEW.startyear as FLOAT) >=2.5 AND 
		cast (NEW.startyear as FLOAT) < 5 ) THEN 
		INSERT INTO table_25_50 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as FLOAT) >=5 AND 
		cast (NEW.startyear as FLOAT) < 1930 ) THEN 
		INSERT INTO table_50_75 VALUES (NEW.*);
	ELSIF ( cast(NEW.startyear as FLOAT) >=7.5 AND 
		cast (NEW.startyear as FLOAT) < 10) THEN 
		INSERT INTO table_75_10 VALUES (NEW.*);
	ELSE 
		RAISE EXCEPTION 'Out of range year value. Fix the ratings_insert_trigger';
	END IF;
	RETURN NULL;
END; 
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tratings_insert_trigger on ratings;
CREATE TRIGGER ratings_insert_trigger
BEFORE INSERT ON ratings
FOR EACH ROW EXECUTE PROCEDURE ratings_insert_trigger();







	
