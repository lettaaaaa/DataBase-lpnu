SELECT User.name, Rout.start_location, Rout.end_location
FROM `UklonDB`.Rout_has_User
JOIN `UklonDB`.User ON Rout_has_User.User_idUser = User.idUser
JOIN `UklonDB`.Rout ON Rout_has_User.Rout_idRoures = Rout.idRoures
LIMIT 0, 1000;
