explain select startyear,genres, count(genres) from production
where startyear is not null and genres is not null
group by startyear, genres