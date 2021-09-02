show shared_buffers;
alter system set shared_buffers to '1024MB';

select genres. count(*) from production
group by genres
order by count desc
