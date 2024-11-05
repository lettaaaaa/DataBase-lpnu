from my_project.auth.dao.user_dao import UserDAO

class UserService:
    @staticmethod
    def get_all_users(session):
        return UserDAO.get_all_users(session)

    @staticmethod
    def get_user_by_id(session, user_id):
        return UserDAO.get_user_by_id(session, user_id)

    @staticmethod
    def create_user(session, user_data):
        return UserDAO.create_user(session, user_data)

    @staticmethod
    def update_user(session, user_id, updated_data):
        return UserDAO.update_user(session, user_id, updated_data)

    @staticmethod
    def delete_user(session, user_id):
        return UserDAO.delete_user(session, user_id)

    @staticmethod
    def get_users_with_routs(session):
        return UserDAO.get_users_with_routs(session)
