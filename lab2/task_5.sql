SELECT DISTINCT P1.maker
FROM Product P1
WHERE P1.type = 'Printer'
  AND P1.maker IN (
    SELECT P2.maker
    FROM Product P2
    JOIN PC ON P2.model = PC.model
    WHERE PC.ram = (
      SELECT MIN(ram) FROM PC
    )
  );
