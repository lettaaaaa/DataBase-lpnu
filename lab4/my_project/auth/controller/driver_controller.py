from flask import jsonify, request
from my_project.auth.service.driver_service import DriverService
from db_init import db

class DriverController:
    @staticmethod
    def get_all_drivers():
        drivers = DriverService.get_all_drivers(db.session)
        return jsonify([driver.to_dict() for driver in drivers])

    @staticmethod
    def get_driver_by_id(driver_id):
        driver = DriverService.get_driver_by_id(db.session, driver_id)
        return jsonify(driver.to_dict()) if driver else (jsonify({"error": "Driver not found"}), 404)

    @staticmethod
    def create_driver():
        driver_data = request.json
        driver = DriverService.create_driver(db.session, driver_data)
        return jsonify(driver.to_dict()), 201

    @staticmethod
    def update_driver(driver_id):
        updated_data = request.json
        driver = DriverService.update_driver(db.session, driver_id, updated_data)
        return jsonify(driver.to_dict()) if driver else (jsonify({"error": "Driver not found"}), 404)

    @staticmethod
    def delete_driver(driver_id):
        driver = DriverService.delete_driver(db.session, driver_id)
        return jsonify({"message": "Driver deleted"}) if driver else (jsonify({"error": "Driver not found"}), 404)
