# trip.py

from db_init import db
from datetime import datetime
from my_project.auth.models.all import Ratings, Car, Rout, Payments, RideFare, Review
from my_project.auth.models.driver import Driver


class Trip(db.Model):
    __tablename__ = 'trip'

    idTrip = db.Column(db.Integer, primary_key=True, autoincrement=True)
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime, nullable=False)
    status = db.Column(db.String(45), nullable=False)
    User_idUser = db.Column(db.Integer, db.ForeignKey('user.idUser', ondelete="CASCADE"), nullable=False)
    Driver_idDriver = db.Column(db.Integer, db.ForeignKey('driver.idDriver', ondelete="CASCADE"), nullable=False)
    Rout_idRout = db.Column(db.Integer, db.ForeignKey('rout.idRout', ondelete="CASCADE"), nullable=False)
    Payments_idPayments = db.Column(db.Integer, db.ForeignKey('payments.idPayments', ondelete="CASCADE"), nullable=False)
    Ride_Fare_idRide_Fare = db.Column(db.Integer, db.ForeignKey('ride_fare.idRide_Fare', ondelete="CASCADE"), nullable=False)

    # Устанавливаем отношение с Driver
    driver = db.relationship('Driver', back_populates='trips')

    def __repr__(self):
        return f"<Trip(idTrip={self.idTrip}, status='{self.status}', start_time='{self.start_time}', end_time='{self.end_time}')>"

    def to_dict(self):
        return {
            "idTrip": self.idTrip,
            "start_time": self.start_time.isoformat() if isinstance(self.start_time, datetime) else self.start_time,
            "end_time": self.end_time.isoformat() if isinstance(self.end_time, datetime) else self.end_time,
            "status": self.status,
            "User_idUser": self.User_idUser,
            "Driver_idDriver": self.Driver_idDriver,
            "Rout_idRout": self.Rout_idRout,
            "Payments_idPayments": self.Payments_idPayments,
            "Ride_Fare_idRide_Fare": self.Ride_Fare_idRide_Fare
        }
