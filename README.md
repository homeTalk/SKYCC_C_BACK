# SKYCC_C_BACK
Backend Repository for TEAM SKYCC_C


### 가상환경 생성 및 Flask 설치

- 아래 명령어로 가상 환경 폴더 만듬
    - python3 -m venv .venv
- 가상환경 활성화 명렁어
    - .venv\Scripts\activate.bat
- Flask 설치
    - pip install Flask


### Application Setup

- debug 모드로 flask 앱 실행
    - flask --app flaskr run --debug

### 배포

mkdir deploy
cp app.py deploy/application.py
cp -r templates deploy/templates
pip freeze > deploy/requirements.txt
cd deploy

application = app = Flask(__name__)
app.run()

pip install awsebcli
eb init

### 수정사항 반영

eb deploy dajungEnv