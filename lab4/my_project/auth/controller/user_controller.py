from flask import jsonify, request
from my_project.auth.service.user_service import UserService
from db_init import db

class UserController:
    @staticmethod
    def get_all_users():
        users = UserService.get_all_users(db.session)
        return jsonify([user.to_dict() for user in users])

    @staticmethod
    def get_user_by_id(user_id):
        user = UserService.get_user_by_id(db.session, user_id)
        return jsonify(user.to_dict()) if user else ( jsonify({"error": "User not found"}), 404 )

    @staticmethod
    def create_user():
        user_data = request.json
        user = UserService.create_user(db.session, user_data)
        return jsonify(user.to_dict()), 201

    @staticmethod
    def update_user(user_id):
        updated_data = request.json
        user = UserService.update_user(db.session, user_id, updated_data)
        return jsonify(user.to_dict()) if user else (jsonify({"error": "User not found"}), 404)

    @staticmethod
    def delete_user(user_id):
        user = UserService.delete_user(db.session, user_id)
        return jsonify({"message": "User deleted"}) if user else (jsonify({"error": "User not found"}), 404)

    @staticmethod
    def get_users_with_routs():
        users_data = UserService.get_users_with_routs(db.session)
        return jsonify(users_data)
