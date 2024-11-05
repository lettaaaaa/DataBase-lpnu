from my_project.auth.dao.driver_dao import DriverDAO

class DriverService:
    @staticmethod
    def get_all_drivers(session):
        return DriverDAO.get_all_drivers(session)

    @staticmethod
    def get_driver_by_id(session, driver_id):
        return DriverDAO.get_driver_by_id(session, driver_id)

    @staticmethod
    def create_driver(session, driver_data):
        return DriverDAO.create_driver(session, driver_data)

    @staticmethod
    def update_driver(session, driver_id, updated_data):
        return DriverDAO.update_driver(session, driver_id, updated_data)

    @staticmethod
    def delete_driver(session, driver_id):
        return DriverDAO.delete_driver(session, driver_id)
