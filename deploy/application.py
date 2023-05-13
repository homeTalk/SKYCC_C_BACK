from flask import Flask, render_template, request, jsonify, make_response
from flask_restful import Resource, Api

application =app = Flask(__name__)
api = Api(application)

# Example API
class MainApi(Resource):
    def get(self):
        return {'hello': 'world'}

api.add_resource(MainApi, '/')

from mission import missionAPI
api.add_resource(BookBasketApi, '/basket')




@app.route('/mission/<int:mission_category>', methods=['GET'])
def get_mission_details(mission_category):

    if mission_category == 1:
        mission = {
            "mission_id": 1,
            "mission_name": "나는 __에게 고마운 일이 있다",
            "mission_description": "누구에게 고마웠던 일을 적으세요"
        }
        family_members = [
            {
                "name": "춘식이",
                "status": True,
                "message": "라이언"
            },
            {
                "name": "라이언",
                "status": False,
                "message": ""
            },
            {
                "name": "어피치",
                "status": False,
                "message": ""
                       },
            {
                "name": "프로도",
                "status": True,
                "message": "춘식이"
            }
        ]

        response = {
            "mission": mission,
            "family_members": family_members
        }

        return jsonify(response), 200
    elif mission_category == 2:
        # mission_category가 2인 경우에 대한 동작을 수행
        # TODO: mission_category가 2인 경우의 동작 구현
        return jsonify({"message": "Mission category 2 동작 수행"}), 200
    elif mission_category == 3:
        # mission_category가 3인 경우에 대한 동작을 수행
        # TODO: mission_category가 3인 경우의 동작 구현
        return jsonify({"message": "Mission category 3 동작 수행"}), 200
    else:
        return jsonify({"message": "해당 mission category는 지원되지 않습니다."}), 404

@app.route('/signup', methods=['POST'])
def signup():
    data = request.get_json()
    username = data.get('username')
    email = data.get('email')
    password = data.get('password')

    response = {
        "message": "회원 가입이 성공적으로 완료되었습니다."
    }
    return jsonify(response), 201

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    response = {
        "message": "로그인이 성공적으로 완료되었습니다."
    }
    return jsonify(response), 200


if __name__ == '__main__':
    app.run()
