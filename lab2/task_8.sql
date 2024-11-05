SELECT S.name AS ship, C.displacement, C.numGuns
FROM Ships S
JOIN Classes C ON S.class = C.class
WHERE S.name IN (
   SELECT O.ship
   FROM Outcomes O
   JOIN Battles B ON O.battle = B.name
   WHERE B.name = 'Guadalcanal'
)
LIMIT 0, 1000;
