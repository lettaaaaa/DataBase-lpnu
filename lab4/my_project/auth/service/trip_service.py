from my_project.auth.dao.trip_dao import TripDAO
from sqlalchemy.orm import Session

class TripService:
    @staticmethod
    def get_all_trips(session: Session):
        return TripDAO.get_all_trips(session)

    @staticmethod
    def get_trip_by_id(session: Session, trip_id: int):
        return TripDAO.get_trip_by_id(session, trip_id)

    @staticmethod
    def create_trip(session: Session, trip_data: dict):
        return TripDAO.create_trip(session, trip_data)

    @staticmethod
    def update_trip(session: Session, trip_id: int, updated_data: dict):
        return TripDAO.update_trip(session, trip_id, updated_data)

    @staticmethod
    def delete_trip(session: Session, trip_id: int):
        return TripDAO.delete_trip(session, trip_id)
