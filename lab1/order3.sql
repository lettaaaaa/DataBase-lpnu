SELECT Trip.idTrip, Payments.amount, Payments.payment_date, Payments.payment_status
FROM UklonDB.Trip
JOIN UklonDB.Payments ON Trip.Payments_idPayments = Payments.idPayments
WHERE Payments.payment_date = '2023-09-01'
LIMIT 0, 1000;
