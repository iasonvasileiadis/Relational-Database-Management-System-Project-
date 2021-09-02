explain select genres ,count(*) from production
group by genres
order by count desc
db.accounts.dropIndex( { "genres": 1 }, { "genres": 1 })