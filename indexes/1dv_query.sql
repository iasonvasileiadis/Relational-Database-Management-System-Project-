drop index if exists idx_query_5a_production;
create index idx_query_5a_production on 
production using btree (genres)
where genres like '%Action' and genres like 'Drama';

drop index if exists idx_query_5b_production;
create index idx_query_5b_production on 
ratings using btree (avgrating desc) ;

explain select genres, avgrating from production 
inner join ratings on production.tconst=ratings.tconst
where genres like ' Drama%' or genres like 'Action%' order by avgrating desc 

select startyear, genres, count (genres) from production 
group by startyear, genres 