drop index if exists idx_query_4_production;
create index idx_query_4_production on 
production using btree (genres asc, startyear asc, endyear asc)
where genres like '%Action%' and startyear>='1990';


explain select genres, startyear, endyear, count (*)
from production where genres like '%Action%' and startyear>='1990'
and endyear<='2010' group by genres, startyear, endyear
