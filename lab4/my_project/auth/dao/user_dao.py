from my_project.auth.models.user import User

class UserDAO:
    @staticmethod
    def get_all_users(session):
        return session.query(User).all()

    @staticmethod
    def get_user_by_id(session, user_id):
        return session.query(User).get(user_id)

    @staticmethod
    def create_user(session, user_data):
        user = User(**user_data)
        session.add(user)
        session.commit()
        return user

    @staticmethod
    def update_user(session, user_id, updated_data):
        user = session.query(User).get(user_id)
        if user:
            for key, value in updated_data.items():
                setattr(user, key, value)
            session.commit()
        return user

    @staticmethod
    def delete_user(session, user_id):
        user = session.query(User).get(user_id)
        if user:
            session.delete(user)
            session.commit()
        return user

    @staticmethod
    def get_users_with_routs(session):
        users = session.query(User).all()  # Получение всех пользователей
        users_data = [user.to_dict() for user in users]  # Преобразование в словари
        return users_data
