# SKYCC_C_BACK

이 리포지토리는 SKYCC C팀의 서비스 '다정'의 백엔드 코드를 관리하기 위한 리포지토리입니다. 최상위 디렉토리에는 테스트를 위한 파일들이 있으며, Elastic Beanstalk에 배포되는 코드는 deploy 폴더 안에 있습니다.

### 가상환경 생성 및 Flask 설치
- 리포지토리를 클론 받은 후, 가상 환경을 생성하고 Flask를 설치해야 합니다.
- 가상 환경 생성 명령어
    - python3 -m venv .venv
- 가상환경 활성화 명렁어
    - .venv\Scripts\activate.bat
- Flask 설치
    - pip install Flask
### Application Setup
- debug 모드로 flask 앱 실행
    - flask --app flaskr run --debug

### 배포
- 사전작업
    - mkdir deploy
    - cp app.py deploy/application.py
    - cp -r templates deploy/templates
    - pip freeze > deploy/requirements.txt
    - cd deploy
- 변경한 코드
    - application = app = Flask(__name__)
    - app.run()
- Elastic Beanstalk에 배포
    - eb init
    - eb create dajungEnv
    - eb deploy dajungEnv

### 코드 수정사항 반영 명령어
- eb deploy dajungEnv
    - 해당 명령어를 입력하면 자동으로 elastic beanstalk에 배포됨.


### ERD
![erd](https://github.com/skycc-dajung/SKYCC_C_BACK/assets/75142329/e1d1e759-2c4d-4f15-a8f3-e73c03472985)
- 테이블은 최상위 디렉토리에 있는 create_table.sql 파일을 사용했습니다.