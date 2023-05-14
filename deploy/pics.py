from flask import Blueprint, request, send_from_directory

pic = Blueprint("pic", __name__, template_folder="template")

@pic.route('/upload', methods=['POST'])
def upload():
    if 'photo' in request.files:
        photo = request.files['photo']
        photo.save('static/images/' + photo.filename)
        return '사진이 업로드되었습니다.'
    
@pic.route('/download', methods=['GET'])
def download():
    filename = request.args.get('filename')
    return send_from_directory(pic.static_folder + '/images/', filename, as_attachment=True)

@pic.route('/image/<path:filename>')
def image(filename):
    return send_from_directory(pic.static_folder + '/images/', filename)