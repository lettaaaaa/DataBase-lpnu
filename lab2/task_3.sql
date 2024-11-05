SELECT Product.maker, Product.model, 
       COALESCE(PC.price, Laptop.price, Printer.price) AS price
FROM Product
LEFT JOIN PC ON Product.model = PC.model
LEFT JOIN Laptop ON Product.model = Laptop.model
LEFT JOIN Printer ON Product.model = Printer.model
WHERE Product.type IN ('PC', 'Laptop', 'Printer');
