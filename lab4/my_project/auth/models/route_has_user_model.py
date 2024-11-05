from db_init import db

# Вспомогательная таблица для связи многие-ко-многим между Rout и User
rout_has_user = db.Table(
    'rout_has_user',
    db.Column('Rout_idRout', db.Integer, db.ForeignKey('rout.idRout', ondelete="CASCADE"), primary_key=True),
    db.Column('User_idUser', db.Integer, db.ForeignKey('user.idUser', ondelete="CASCADE"), primary_key=True)
)