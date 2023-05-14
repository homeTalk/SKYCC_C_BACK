from flask import Flask, request, jsonify, render_template, send_from_directory

application = app = Flask(__name__)

from profiles import profile
from missions import mission
from pics import pic
from familys import family

app.register_blueprint(profile, url_prefix='/profile')
app.register_blueprint(mission, url_prefix='/mission')
app.register_blueprint(pic, url_prefix='/photo')
app.register_blueprint(family, url_prefix='/family')


@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run()