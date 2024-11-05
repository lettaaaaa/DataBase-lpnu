from flask import Blueprint
from my_project.auth.controller.driver_controller import DriverController

driver_bp = Blueprint('driver', __name__)


@driver_bp.route('/drivers', methods=['GET'])
def get_all_drivers():
    return DriverController.get_all_drivers()


@driver_bp.route('/drivers/<int:driver_id>', methods=['GET'])
def get_driver_by_id(driver_id):
    return DriverController.get_driver_by_id(driver_id)


@driver_bp.route('/drivers', methods=['POST'])
def create_driver():
    return DriverController.create_driver()

@driver_bp.route('/drivers/<int:driver_id>', methods=['PUT'])
def update_driver(driver_id):
    return DriverController.update_driver(driver_id)

@driver_bp.route('/drivers/<int:driver_id>', methods=['DELETE'])
def delete_driver(driver_id):
    return DriverController.delete_driver(driver_id)
