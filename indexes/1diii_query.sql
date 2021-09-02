drop index if exists idx_query_3_production;
create index idx_query_3_production on 
production using btree(genres asc, startyear asc);
where startyear is not null and genres is not null; 



explain select startyear, genres, count (genres) from production 
where startyear is not null and genres is not null
group by startyear, genres 