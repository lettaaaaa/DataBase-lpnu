# driver.py

from db_init import db

class Driver(db.Model):
    __tablename__ = 'driver'

    idDriver = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(45), nullable=False)
    phone_number = db.Column(db.String(15), nullable=False, unique=True)
    licence_number = db.Column(db.String(45), nullable=False, unique=True)
    Ratings_idRatings = db.Column(db.Integer, db.ForeignKey('ratings.idRatings'), nullable=False)

    # Добавление отношения с Car
    cars = db.relationship('Car', back_populates='driver')
    reviews = db.relationship('Review', back_populates='driver')
    trips = db.relationship('Trip', back_populates='driver')

    def to_dict(self):
        return {
            "idDriver": self.idDriver,
            "name": self.name,
            "phone_number": self.phone_number,
            "licence_number": self.licence_number,
            "Ratings_idRatings": self.Ratings_idRatings,
            "trips": [trip.to_dict() for trip in self.trips]
        }
