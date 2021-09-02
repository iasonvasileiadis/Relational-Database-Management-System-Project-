drop index if exists idx_query_2_production;
create index idx_query_2_production on 
production using btree(genres asc nulls last, startyear asc nulls last);

explain select staryear, genres, count(genres) from production
group by startyear, genres 