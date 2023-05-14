from flask import Flask, request, jsonify, render_template, send_from_directory
import config
from db_connect import db

application = app = Flask(__name__)

from profiles import profile
from missions import mission
from photos import photo

app.register_blueprint(profile, url_prefix='/profile')
app.register_blueprint(mission, url_prefix='/mission')
app.register_blueprint(photo, url_prefix='/photo')

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run()