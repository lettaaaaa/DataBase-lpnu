from flask import Flask
import MySQLdb
from db_init import db
from my_project.auth.route.trip_route import trip_bp
from my_project.auth.route.driver_route import driver_bp
from my_project.auth.route.user_route import user_bp



app = Flask(__name__)
# Конфигурация базы данных
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:1234567890@localhost/uklondb'

db.init_app(app)  # Создание экземпляра SQLAlchemy
app.register_blueprint(trip_bp, url_prefix='/api')
app.register_blueprint(driver_bp, url_prefix='/api')
app.register_blueprint(user_bp, url_prefix='/api')



if __name__ == '__main__':
    app.run(debug=True)
