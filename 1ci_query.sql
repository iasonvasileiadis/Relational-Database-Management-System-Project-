alter system set max_parallel_workers_per_gather to 8;

select genres, count(*) from production
group by genres
order by count desc