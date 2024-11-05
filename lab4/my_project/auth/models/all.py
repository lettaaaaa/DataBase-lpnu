from db_init import db
from my_project.auth.models.route_has_user_model import rout_has_user
from datetime import date

# Модель для таблицы Ratings
class Ratings(db.Model):
    __tablename__ = 'ratings'

    idRatings = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rating = db.Column(db.Float, nullable=True)
    review = db.Column(db.String(255), nullable=True)
    rating_date = db.Column(db.Date, nullable=True)

    def to_dict(self):
        return {
            "idRatings": self.idRatings,
            "rating": self.rating,
            "review": self.review,
            "rating_date": self.rating_date.isoformat() if self.rating_date else None
        }


# Модель для таблицы Car
class Car(db.Model):
    __tablename__ = 'car'

    idCars = db.Column(db.Integer, primary_key=True, autoincrement=True)
    brand = db.Column(db.String(45), nullable=False)
    model = db.Column(db.String(45), nullable=False)
    plate_number = db.Column(db.String(45), unique=True, nullable=False)
    seats = db.Column(db.Integer, nullable=False)
    Driver_idDriver = db.Column(db.Integer, db.ForeignKey('driver.idDriver', ondelete="CASCADE"), nullable=False)

    # Добавление отношения с Driver
    driver = db.relationship('Driver', back_populates='cars')

    def to_dict(self):
        return {
            "idCars": self.idCars,
            "brand": self.brand,
            "model": self.model,
            "plate_number": self.plate_number,
            "seats": self.seats,
            "Driver_idDriver": self.Driver_idDriver
        }


# Модель для таблицы Rout
class Rout(db.Model):
    __tablename__ = 'rout'

    idRout = db.Column(db.Integer, primary_key=True, autoincrement=True)
    start_location = db.Column(db.String(45), nullable=False)
    end_location = db.Column(db.String(45), nullable=False)
    distance = db.Column(db.Float, nullable=False)

    # Связь с User через вспомогательную таблицу rout_has_user
    users_associated = db.relationship('User', secondary=rout_has_user, back_populates='routs')

    def to_dict(self):
        return {
            "idRout": self.idRout,
            "start_location": self.start_location,
            "end_location": self.end_location,
            "distance": self.distance,

        }


# Модель для таблицы Payments
class Payments(db.Model):
    __tablename__ = 'payments'

    idPayments = db.Column(db.Integer, primary_key=True, autoincrement=True)
    amount = db.Column(db.Float, nullable=False)
    payment_date = db.Column(db.Date, nullable=False)
    payment_status = db.Column(db.String(45), nullable=False)

    def to_dict(self):
        return {
            "idPayments": self.idPayments,
            "amount": self.amount,
            "payment_date": self.payment_date.isoformat() if self.payment_date else None,
            "payment_status": self.payment_status
        }


# Модель для таблицы RideFare
class RideFare(db.Model):
    __tablename__ = 'ride_fare'

    idRide_Fare = db.Column(db.Integer, primary_key=True, autoincrement=True)
    base_fare = db.Column(db.Float, nullable=False)
    distance_fare = db.Column(db.Float, nullable=False)
    total_fare = db.Column(db.Float, nullable=False)

    def to_dict(self):
        return {
            "idRide_Fare": self.idRide_Fare,
            "base_fare": self.base_fare,
            "distance_fare": self.distance_fare,
            "total_fare": self.total_fare
        }


# Модель для таблицы Review
class Review(db.Model):
    __tablename__ = 'review'

    idReviews = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rating = db.Column(db.Float, nullable=False)
    comment = db.Column(db.String(255), nullable=False)
    created_at = db.Column(db.Date, nullable=False)
    Driver_idDriver = db.Column(db.Integer, db.ForeignKey('driver.idDriver', ondelete="CASCADE"), nullable=False)

    driver = db.relationship('Driver', back_populates='reviews')

    def to_dict(self):
        return {
            "idReviews": self.idReviews,
            "rating": self.rating,
            "comment": self.comment,
            "created_at": self.created_at.isoformat() if self.created_at else None,
            "Driver_idDriver": self.Driver_idDriver
        }


