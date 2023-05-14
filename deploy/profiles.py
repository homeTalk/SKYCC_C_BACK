from flask import Blueprint

profile = Blueprint("profile", __name__, template_folder="template")

@profile.route('/')
def profile_ready():
    return 'What is your name?'

@profile.route('/<name>')
def profile_name(name):
    return f'Hello {name}!'