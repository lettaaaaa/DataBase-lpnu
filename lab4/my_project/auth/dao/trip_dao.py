from my_project.auth.models.trip import Trip
from sqlalchemy.orm import Session

class TripDAO:
    @staticmethod
    def get_all_trips(session: Session):
        return session.query(Trip).all()

    @staticmethod
    def get_trip_by_id(session: Session, trip_id: int):
        return session.query(Trip).filter(Trip.idTrip == trip_id).first()

    @staticmethod
    def create_trip(session: Session, trip_data: dict):
        new_trip = Trip(**trip_data)
        session.add(new_trip)
        session.commit()
        return new_trip

    @staticmethod
    def update_trip(session: Session, trip_id: int, updated_data: dict):
        trip = session.query(Trip).filter(Trip.idTrip == trip_id).first()
        if trip:
            for key, value in updated_data.items():
                setattr(trip, key, value)
            session.commit()
        return trip

    @staticmethod
    def delete_trip(session: Session, trip_id: int):
        trip = session.query(Trip).filter(Trip.idTrip == trip_id).first()
        if trip:
            session.delete(trip)
            session.commit()
        return trip
