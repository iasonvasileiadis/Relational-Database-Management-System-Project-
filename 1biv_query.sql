select genres, startyear, endyear, count(*) from production where genres like '%Actions%' and startyear>= '1999' and endyear<='2010' group by gnres, startyear, endyear