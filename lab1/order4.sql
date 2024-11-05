USE UklonDB;
SELECT Driver.name, Ratings.rating
FROM Driver
JOIN Ratings ON Driver.Ratings_idRatings = Ratings.idRatings
LIMIT 0, 1000;

