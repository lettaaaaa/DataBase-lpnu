from my_project.auth.models.driver import Driver


class DriverDAO:
    @staticmethod
    def get_all_drivers(session):
        return session.query(Driver).all()

    @staticmethod
    def get_driver_by_id(session, driver_id):
        return session.query(Driver).get(driver_id)

    @staticmethod
    def create_driver(session, driver_data):
        driver = Driver(**driver_data)
        session.add(driver)
        session.commit()
        return driver

    @staticmethod
    def update_driver(session, driver_id, updated_data):
        driver = session.query(Driver).get(driver_id)
        if driver:
            for key, value in updated_data.items():
                setattr(driver, key, value)
            session.commit()
        return driver

    @staticmethod
    def delete_driver(session, driver_id):
        driver = session.query(Driver).get(driver_id)
        if driver:
            session.delete(driver)
            session.commit()
        return driver

    @staticmethod
    def get_drivers_with_trips(session):
        drivers = Driver.query.all()
