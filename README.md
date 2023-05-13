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

자세한 내용 다음 링크 참고: https://velog.io/@lzlko/%EA%B0%95%EC%9D%98-%EC%8A%A4%ED%8C%8C%EB%A5%B4%ED%83%80-%EC%BD%94%EB%94%A9%ED%81%B4%EB%9F%BD-%EC%9B%B9%EA%B0%9C%EB%B0%9C-%ED%92%80%EC%8A%A4%ED%83%9D-5%EC%A3%BC%EC%B0%A8og%ED%83%9C%EA%B7%B8-%EB%B0%8F-%EB%B0%B0%ED%8F%AC