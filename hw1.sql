
select count(*) from green_taxi_data where date(lpep_pickup_datetime) = '2019-09-18' and date(lpep_dropoff_datetime) = '2019-09-18'

select date(lpep_pickup_datetime)
from green_taxi_data
where trip_distance = (select max(trip_distance) from green_taxi_data)


select b."Borough"
from green_taxi_data as a 
left join taxi_zone_lookup as b
on a."PULocationID" = b."LocationID"
where  date(lpep_pickup_datetime) = '2019-09-18' 
group by b."Borough"
having sum(total_amount) > 50000



select lpep_pickup_datetime, lpep_dropoff_datetime, a."PULocationID", b."Zone" as pu_zone, c."Zone" as do_zone, tip_amount
from green_taxi_data as a 
left join taxi_zone_lookup as b
on a."PULocationID" = b."LocationID"
left join taxi_zone_lookup as c
on a."DOLocationID" = c."LocationID"
where date(lpep_pickup_datetime) >= '2019-09-01'
and date(lpep_pickup_datetime) < '2019-10-01'
and b."Zone" = 'Astoria'
order by 6 desc
limit 5