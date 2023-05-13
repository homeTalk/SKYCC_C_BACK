from flask import Flask, request, jsonify

application =app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello, World!'

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
        # mission_category가 2인 경우에 대한 동작을 수행합니다.
        # TODO: mission_category가 2인 경우의 동작 구현
        return jsonify({"message": "Mission category 2 동작 수행"}), 200
    elif mission_category == 3:
        # mission_category가 3인 경우에 대한 동작을 수행합니다.
        # TODO: mission_category가 3인 경우의 동작 구현
        return jsonify({"message": "Mission category 3 동작 수행"}), 200
    else:
        return jsonify({"message": "해당 mission category는 지원되지 않습니다."}), 404

if __name__ == '__main__':
    app.run()
