---Find each rider’s name, driver’s name, and fare amount for every ride.

SELECT ri.name as rider_name,d.name as driver_name,r.fare from drivers as d
join rides as r on r.driver_id=d.driver_id
join riders as ri on ri.rider_id=r.ride_id;

---Classify each ride’s fare into categories: “Low” (<10), “Medium” (10–30), “High” (>30).

SELECT ride_id,fare,case when fare < 10 then "Low"
when fare >30 then "High" 
when fare BETWEEN 10 and 30 then "Medium"
end as Category_fare from rides;

---For each rider, show their ride ID, fare, and the fare of their next ride.
SELECT rider_id,ride_id,fare,lead(fare) over(PARTITION by rider_id order by 
pickup_time) as fare_of_next_ride from rides;

---For each driver, display their ride ID, fare, and the fare of their previous ride.
SELECT driver_id,ride_id,fare,lag(fare) over(PARTITION by driver_id
order by pickup_time) as prev_fair from rides;

---Rank riders within each city based on their total spending.
SELECT 
    r.city,
    r.rider_id,
    r.name,
    SUM(rd.fare) AS total_spent,
    RANK() OVER (PARTITION BY r.city ORDER BY SUM(rd.fare) DESC) AS rank_in_city
FROM rides rd
JOIN riders r ON rd.rider_id = r.rider_id
GROUP BY r.city, r.rider_id, r.name;


---Using a CTE, calculate the average fare per driver, then list only those drivers whose average fare is above the overall average fare.
with temp_1 as (SELECT d.driver_id,d.name,avg(r.fare) as avg_fare from drivers as d
join rides as r on r.driver_id=d.driver_id
group by d.driver_id,d.name) 
SELECT * from temp_1
where avg_fare > (SELECT avg(fare) from rides);

---Find the riders who have spent more than the average rider spending.
SELECT ri.rider_id,ri.name,sum(r.fare) from riders as ri
join rides as r on r.rider_id=ri.rider_id
group by ri.rider_id,ri.name
having sum(r.fare) > (SELECT avg(total_spent) from (SELECT rider_id,sum(fare) as total_spent
from rides
group by rider_id));



---Find the cumulative distribution of driver ratings across all drivers.
SELECT driver_id,rating,cume_dist() over(order by rating) from drivers;

---Rank riders by total spending using percent rank.
SELECT rider_id,sum(fare) as total_spent,percent_rank() over(order by sum(fare)) as rnk
from rides 
group by rider_id;


---For each rider, calculate how many days passed between their first and most recent ride.
SELECT r.rider_id,r.name,round(max(julianday(rd.pickup_time))-min(julianday(rd.pickup_time)),0) as difference
from riders as r join rides as rd on rd.rider_id=r.rider_id
group by r.rider_id,r.name;



