SELECT DISTINCT Product.maker
FROM Product
WHERE Product.type = 'PC'
  AND Product.model NOT IN (
    SELECT PC.model
    FROM PC
  );
