from flask import Blueprint, send_from_directory

family = Blueprint("family", __name__, template_folder="template")

@family.route('/name/<int:family_id>', methods=['GET'])
def family_name():
    return '민재네 가족'

@family.route('/characte/<int:family_id>', methods=['GET'])
def character():
    return send_from_directory(family.static_folder + '/family/', character.png)