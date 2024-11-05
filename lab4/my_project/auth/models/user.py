# user.py

from db_init import db
from my_project.auth.models.route_has_user_model import rout_has_user

class User(db.Model):
    __tablename__ = 'user'

    idUser = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(45), nullable=False)
    phone_number = db.Column(db.String(45), unique=True, nullable=False)

    # Связь с Rout через вспомогательную таблицу rout_has_user
    routs = db.relationship('Rout', secondary=rout_has_user, back_populates='users_associated')

    def to_dict(self):
        return {
            "idUser": self.idUser,
            "name": self.name,
            "phone_number": self.phone_number,
            "routs": [rout.to_dict() for rout in self.routs]
        }
