SELECT Trip.idTrip, Trip.start_time, Trip.end_time, Trip.status, Driver.name, Ratings.rating
FROM `UklonDB`.Trip
JOIN `UklonDB`.Driver ON Trip.Driver_idDriver = Driver.idDriver
JOIN `UklonDB`.Ratings ON Trip.Driver_Ratings_idRatings = Ratings.idRatings;
