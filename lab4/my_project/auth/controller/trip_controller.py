from flask import jsonify, request
from my_project.auth.service.trip_service import TripService
from db_init import db

class TripController:
    @staticmethod
    def get_all_trips():
        trips = TripService.get_all_trips(db.session)
        return jsonify([trip.to_dict() for trip in trips])

    @staticmethod
    def get_trip_by_id(trip_id: int):
        trip = TripService.get_trip_by_id(db.session, trip_id)
        return jsonify(trip.to_dict()) if trip else (jsonify({"error": "Trip not found"}), 404)

    @staticmethod
    def create_trip():
        trip_data = request.json
        trip = TripService.create_trip(db.session, trip_data)
        return jsonify(trip.to_dict()), 201

    @staticmethod
    def update_trip(trip_id: int):
        updated_data = request.json
        trip = TripService.update_trip(db.session, trip_id, updated_data)
        return jsonify(trip.to_dict()) if trip else (jsonify({"error": "Trip not found"}), 404)

    @staticmethod
    def delete_trip(trip_id: int):
        trip = TripService.delete_trip(db.session, trip_id)
        return jsonify({"message": "Trip deleted"}) if trip else (jsonify({"error": "Trip not found"}), 404)
