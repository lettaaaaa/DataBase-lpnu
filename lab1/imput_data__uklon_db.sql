USE UklonDB;

-- Вставка данных в таблицу Ratings
INSERT INTO Ratings (rating, review, rating_date) VALUES
(4.5, 'Great service!', '2023-08-01'),
(3.8, 'Satisfactory', '2023-08-05'),
(4.9, 'Excellent driver', '2023-08-10'),
(2.7, 'Late arrival', '2023-08-12'),
(5.0, 'Perfect!', '2023-08-15'),
(4.2, 'Very good', '2023-08-18'),
(3.5, 'Average', '2023-08-20'),
(4.0, 'Good experience', '2023-08-25');

-- Вставка данных в таблицу Driver
INSERT INTO Driver (name, rating, phone_number, licence_number, Ratings_idRatings) VALUES
('John Doe', 4.5, 1234567890, 'DL12345', 1),
('Alice Smith', 3.8, 1234567891, 'DL12346', 2),
('Bob Johnson', 4.9, 1234567892, 'DL12347', 3),
('Michael Brown', 2.7, 1234567893, 'DL12348', 4),
('Sarah Davis', 5.0, 1234567894, 'DL12349', 5),
('Chris Wilson', 4.2, 1234567895, 'DL12350', 6),
('Emily Clark', 3.5, 1234567896, 'DL12351', 7),
('David Lewis', 4.0, 1234567897, 'DL12352', 8);

-- Вставка данных в таблицу Car
INSERT INTO Car (brand, model, plate_number, seats, Driver_idDriver) VALUES
('Toyota', 'Camry', 'ABC123', '4', 1),
('Honda', 'Civic', 'XYZ456', '4', 2),
('Ford', 'Focus', 'DEF789', '4', 3),
('BMW', 'X5', 'GHI012', '5', 4),
('Tesla', 'Model S', 'JKL345', '5', 5),
('Nissan', 'Altima', 'MNO678', '4', 6),
('Chevrolet', 'Malibu', 'PQR901', '4', 7),
('Audi', 'A4', 'STU234', '4', 8);

-- Вставка данных в таблицу User
INSERT INTO User (name, phone_number) VALUES
('John Smith', '9876543210'),
('Emma Watson', '9876543211'),
('Liam Johnson', '9876543212'),
('Olivia Brown', '9876543213'),
('Noah Davis', '9876543214'),
('Ava Wilson', '9876543215'),
('Sophia Clark', '9876543216'),
('James Lewis', '9876543217');

-- Вставка данных в таблицу Rout
INSERT INTO Rout (start_location, end_location, distance) VALUES
('New York', 'Los Angeles', 4500),
('San Francisco', 'Las Vegas', 800),
('Miami', 'Orlando', 400),
('Chicago', 'Detroit', 300),
('Houston', 'Dallas', 350),
('Seattle', 'Portland', 280),
('Boston', 'New York', 300),
('Denver', 'Salt Lake City', 800);

-- Вставка данных в таблицу Payments
INSERT INTO Payments (amount, payment_date, payment_status) VALUES
(50.00, '2023-08-01', 'Completed'),
(75.00, '2023-08-05', 'Pending'),
(100.00, '2023-08-10', 'Completed'),
(30.00, '2023-08-12', 'Failed'),
(120.00, '2023-08-15', 'Completed'),
(85.00, '2023-08-18', 'Pending'),
(60.00, '2023-08-20', 'Completed'),
(95.00, '2023-08-25', 'Completed');

-- Вставка данных в таблицу Ride_Fare
INSERT INTO Ride_Fare (base_fare, distance_fare, total_fare) VALUES
(10.00, 40.00, 50.00),
(15.00, 60.00, 75.00),
(20.00, 80.00, 100.00),
(8.00, 22.00, 30.00),
(25.00, 95.00, 120.00),
(17.00, 68.00, 85.00),
(12.00, 48.00, 60.00),
(22.00, 73.00, 95.00);

-- Вставка данных в таблицу Trip
INSERT INTO Trip (start_time, end_time, status, User_idUser, Driver_idDriver, Driver_Ratings_idRatings, Rout_idRoures, Payments_idPayments, Ride_Fare_idRide_Fare) VALUES
('08:00:00', '10:00:00', 'Completed', 1, 1, 1, 1, 1, 1),
('09:00:00', '11:30:00', 'Pending', 2, 2, 2, 2, 2, 2),
('10:00:00', '12:30:00', 'Completed', 3, 3, 3, 3, 3, 3),
('11:00:00', '12:00:00', 'Cancelled', 4, 4, 4, 4, 4, 4),
('12:00:00', '13:45:00', 'Completed', 5, 5, 5, 5, 5, 5),
('13:00:00', '14:50:00', 'Pending', 6, 6, 6, 6, 6, 6),
('14:00:00', '15:30:00', 'Completed', 7, 7, 7, 7, 7, 7),
('15:00:00', '16:45:00', 'Completed', 8, 8, 8, 8, 8, 8);

-- Вставка данных в таблицу Rout_has_User
INSERT INTO Rout_has_User (Rout_idRoures, User_idUser) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- Вставка данных в таблицу Review
INSERT INTO Review (idReviews, rating, comment, created_at, Driver_idDriver, Driver_Ratings_idRatings) VALUES
(1, 4.5, 'Great service!', '2023-08-01', 1, 1),
(2, 3.8, 'Good, but can improve', '2023-08-05', 2, 2),
(3, 4.9, 'Exceptional driver!', '2023-08-10', 3, 3),
(4, 2.7, 'Arrived late', '2023-08-12', 4, 4),
(5, 5.0, 'Perfect ride!', '2023-08-15', 5, 5),
(6, 4.2, 'Very pleasant experience', '2023-08-18', 6, 6),
(7, 3.5, 'Average service', '2023-08-20', 7, 7),
(8, 4.0, 'Smooth ride, no issues', '2023-08-25', 8, 8);
