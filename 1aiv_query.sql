explain select genres,startyear,endyear,count(*)
from production where genres like '%Action%' and startyear>='1990'
and endyear<='2010' group by genres,startyear,endyear