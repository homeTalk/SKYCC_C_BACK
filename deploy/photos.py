from flask import Blueprint, request, send_from_directory

photo = Blueprint("photo", __name__, template_folder="template")

@photo.route('/upload', methods=['POST'])
def upload():
    if 'photo' in request.files:
        photo = request.files['photo']
        photo.save('static/images/' + photo.filename)
        # 또는 photo.save(os.path.join(app.static_folder, 'images', photo.filename))
        # 파일 경로를 DB에 저장하거나 다른 곳에서 사용할 수 있습니다.
        return '사진이 업로드되었습니다.'
    
@photo.route('/download', methods=['GET'])
def download():
    filename = request.args.get('filename')
    return send_from_directory(photo.static_folder + '/images/', filename, as_attachment=True)

# 화면에 사진 띄우기
@photo.route('/image/<path:filename>')
def image(filename):
    return send_from_directory(photo.static_folder + '/images/', filename)