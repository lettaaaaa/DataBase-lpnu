-- -----------------------------------------------------
-- Вставка даних
-- Заповнення таблиць даними

-- Заповнення таблиці Ratings
INSERT INTO Ratings (rating, review, rating_date) VALUES
  (4.5, 'Very good', '2024-01-15'),
  (3.8, 'Average service', '2024-02-18'),
  (4.9, 'Excellent experience', '2024-03-10'),
  (2.7, 'Below expectations', '2024-04-05'),
  (5.0, 'Perfect', '2024-05-21'),
  (3.2, 'Needs improvement', '2024-06-12'),
  (4.1, 'Good service', '2024-07-08'),
  (2.9, 'Average ride', '2024-08-01'),
  (4.7, 'Great', '2024-09-14'),
  (4.0, 'Satisfactory', '2024-10-03')
ON DUPLICATE KEY UPDATE
  review = VALUES(review),
  rating_date = VALUES(rating_date);

-- Заповнення таблиці Driver
INSERT INTO Driver (name, phone_number, licence_number, Ratings_idRatings) VALUES
  ('John Doe', '1234567890', 'DL12345', 1),
  ('Alice Smith', '1234567891', 'DL12346', 2),
  ('Bob Johnson', '1234567892', 'DL12347', 3),
  ('Michael Brown', '1234567893', 'DL12348', 4),
  ('Sarah Davis', '1234567894', 'DL12349', 5),
  ('Chris Wilson', '1234567895', 'DL12350', 6),
  ('Emily Clark', '1234567896', 'DL12351', 7),
  ('David Lewis', '1234567897', 'DL12352', 8),
  ('Jessica Martinez', '1234567898', 'DL12353', 9),
  ('Mark Anderson', '1234567899', 'DL12354', 10)
ON DUPLICATE KEY UPDATE
  phone_number = VALUES(phone_number),
  licence_number = VALUES(licence_number),
  Ratings_idRatings = VALUES(Ratings_idRatings);

-- Заповнення таблиці Car
INSERT INTO Car (brand, model, plate_number, seats, Driver_idDriver) VALUES
  ('Toyota', 'Camry', 'AA1234BC', 4, 1),
  ('Honda', 'Accord', 'AB1235CD', 4, 2),
  ('Ford', 'Focus', 'AC1236DE', 4, 3),
  ('Nissan', 'Altima', 'AD1237EF', 4, 4),
  ('Chevrolet', 'Malibu', 'AE1238FG', 4, 5),
  ('Hyundai', 'Elantra', 'AF1239GH', 4, 6),
  ('Volkswagen', 'Passat', 'AG1240HI', 4, 7),
  ('Subaru', 'Impreza', 'AH1241IJ', 4, 8),
  ('Mazda', '6', 'AI1242JK', 4, 9),
  ('Kia', 'Optima', 'AJ1243KL', 4, 10)
ON DUPLICATE KEY UPDATE
  seats = VALUES(seats);

-- Заповнення таблиці User
INSERT INTO User (name, phone_number) VALUES
  ('Ethan Hunt', '1987654321'),
  ('Olivia Benson', '1987654322'),
  ('Liam Neeson', '1987654323'),
  ('Sophia Loren', '1987654324'),
  ('Mason Williams', '1987654325'),
  ('Ava Brown', '1987654326'),
  ('Logan Davis', '1987654327'),
  ('Emma Johnson', '1987654328'),
  ('Lucas Martinez', '1987654329'),
  ('Mia Lewis', '1987654330')
ON DUPLICATE KEY UPDATE
  phone_number = VALUES(phone_number);

-- Заповнення таблиці Rout
INSERT INTO Rout (start_location, end_location, distance) VALUES
  ('Downtown', 'Airport', 25.4),
  ('City Center', 'North District', 15.2),
  ('East Side', 'West End', 18.6),
  ('Suburbs', 'Central Park', 12.7),
  ('Old Town', 'New City', 10.3),
  ('Harbor', 'University', 22.5),
  ('Stadium', 'Mall', 9.8),
  ('Library', 'Museum', 7.4),
  ('Beach', 'Amusement Park', 11.2),
  ('Train Station', 'Bus Terminal', 5.6)
ON DUPLICATE KEY UPDATE
  distance = VALUES(distance);

-- Заповнення таблиці Payments
INSERT INTO Payments (amount, payment_date, payment_status) VALUES
  (45.60, '2024-01-20', 'Completed'),
  (30.50, '2024-02-12', 'Completed'),
  (25.75, '2024-03-15', 'Pending'),
  (50.00, '2024-04-08', 'Completed'),
  (60.20, '2024-05-18', 'Completed'),
  (55.30, '2024-06-05', 'Failed'),
  (40.00, '2024-07-10', 'Completed'),
  (35.80, '2024-08-22', 'Refunded'),
  (20.45, '2024-09-30', 'Completed'),
  (75.90, '2024-10-11', 'Pending')
ON DUPLICATE KEY UPDATE
  payment_status = VALUES(payment_status);

-- Заповнення таблиці Ride_Fare
INSERT INTO Ride_Fare (base_fare, distance_fare, total_fare) VALUES
  (5.00, 1.50, 40.50),
  (6.00, 1.30, 35.90),
  (5.50, 1.70, 45.10),
  (6.50, 1.20, 32.80),
  (7.00, 1.40, 39.80),
  (5.25, 1.60, 38.20),
  (5.75, 1.55, 42.75),
  (6.10, 1.35, 37.10),
  (5.95, 1.45, 40.30),
  (6.25, 1.50, 45.00)
ON DUPLICATE KEY UPDATE
  distance_fare = VALUES(distance_fare),
  total_fare = VALUES(total_fare);

-- Заповнення таблиці Trip
INSERT INTO Trip (start_time, end_time, status, User_idUser, Driver_idDriver, Rout_idRout, Payments_idPayments, Ride_Fare_idRide_Fare) VALUES
    ('2024-10-17 08:00:00', '2024-10-17 08:30:00', 'Completed', 1, 1, 1, 1, 1),
    ('2024-10-17 09:15:00', '2024-10-17 09:45:00', 'Completed', 2, 2, 2, 2, 2),
    ('2024-10-17 10:00:00', '2024-10-17 10:25:00', 'Pending', 3, 3, 3, 3, 3),
    ('2024-10-17 11:30:00', '2024-10-17 12:00:00', 'Completed', 4, 4, 4, 4, 4),
    ('2024-10-17 12:45:00', '2024-10-17 13:10:00', 'Completed', 5, 5, 5, 5, 5),
    ('2024-10-17 14:00:00', '2024-10-17 14:30:00', 'Failed', 6, 6, 6, 6, 6),
    ('2024-10-17 15:15:00', '2024-10-17 15:45:00', 'Completed', 7, 7, 7, 7, 7),
    ('2024-10-17 16:30:00', '2024-10-17 17:00:00', 'Refunded', 8, 8, 8, 8, 8),
    ('2024-10-17 18:00:00', '2024-10-17 18:20:00', 'Completed', 9, 9, 9, 9, 9),
    ('2024-10-17 19:10:00', '2024-10-17 19:40:00', 'Pending', 10, 10, 10, 10, 10)
ON DUPLICATE KEY UPDATE
  status = VALUES(status),
  end_time = VALUES(end_time);
  
-- Заповнення таблиці Review
INSERT INTO Review (rating, comment, created_at, Driver_idDriver) VALUES
  (4.5, 'Great driver', '2024-01-25', 1),
  (3.8, 'Average service', '2024-02-16', 2),
  (4.9, 'Very professional', '2024-03-22', 3),
  (2.7, 'Not satisfied', '2024-04-11', 4),
  (5.0, 'Excellent!', '2024-05-19', 5),
  (3.2, 'Could be better', '2024-06-17', 6),
  (4.1, 'Friendly driver', '2024-07-25', 7),
  (2.9, 'Just okay', '2024-08-20', 8),
  (4.7, 'Impressive service', '2024-09-10', 9),
  (4.0, 'Good ride', '2024-10-05', 10)
ON DUPLICATE KEY UPDATE
  comment = VALUES(comment),
  created_at = VALUES(created_at);
