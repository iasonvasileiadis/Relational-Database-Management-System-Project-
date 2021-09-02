explain select genres,avgrating from production
inner join ratings on production.tconst=ratings.tconst
where genres like 'Drama%' or genres like 'Action%' order by avgrating desc