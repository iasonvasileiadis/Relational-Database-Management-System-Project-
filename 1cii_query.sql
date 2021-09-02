select startyear, genres, count (genres) from production 
group by startyear, genres