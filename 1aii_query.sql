explain select startyear,genres, count(genres) from production
group by startyear,genres
db.production_true.group(
{
key:{startyear:1 , genres:1},
cond:{startyear: { $gt : '1970' } },
reduce: function ( curr, result ) { },
initial: { }
}