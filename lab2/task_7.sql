SELECT PIT.date, COUNT(DISTINCT PIT.trip_no) AS number_of_trips
FROM Pass_in_trip PIT
JOIN Trip T ON PIT.trip_no = T.trip_no
WHERE T.town_from = 'London'
GROUP BY PIT.date;
