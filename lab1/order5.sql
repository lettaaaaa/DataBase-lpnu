SELECT Trip.idTrip, Ride_Fare.base_fare, Ride_Fare.distance_fare, Ride_Fare.total_fare
FROM Trip
JOIN Ride_Fare ON Trip.Ride_Fare_idRide_Fare = Ride_Fare.idRide_Fare;
