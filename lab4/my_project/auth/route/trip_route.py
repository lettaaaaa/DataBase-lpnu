from flask import Blueprint
from my_project.auth.controller.trip_controller import TripController

trip_bp = Blueprint('trip', __name__)

@trip_bp.route('/trips', methods=['GET'])
def get_all_trips():
    return TripController.get_all_trips()

@trip_bp.route('/trips/<int:trip_id>', methods=['GET'])
def get_trip_by_id(trip_id):
    return TripController.get_trip_by_id(trip_id)

@trip_bp.route('/trips', methods=['POST'])
def create_trip():
    return TripController.create_trip()

@trip_bp.route('/trips/<int:trip_id>', methods=['PUT'])
def update_trip(trip_id):
    return TripController.update_trip(trip_id)

@trip_bp.route('/trips/<int:trip_id>', methods=['DELETE'])
def delete_trip(trip_id):
    return TripController.delete_trip(trip_id)
