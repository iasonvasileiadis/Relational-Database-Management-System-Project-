drop index if exists idx_query_1_production;
create index idx_query_1_production on 
production using btree(genres asc nulls last);

explain select genres, count (*) from production 
group by genres 
order by count desc

