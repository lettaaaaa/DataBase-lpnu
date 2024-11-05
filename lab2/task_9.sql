SELECT 
  I.point, 
  I.date, 
  I.inc, 
  O.out
FROM Income_o I
LEFT JOIN Outcome_o O 
  ON I.point = O.point AND I.date = O.date

UNION

SELECT 
  O.point, 
  O.date, 
  I.inc, 
  O.out
FROM Outcome_o O
LEFT JOIN Income_o I 
  ON O.point = I.point AND O.date = I.date
WHERE I.inc IS NULL;
