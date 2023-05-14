from flask import Blueprint, jsonify, request

schedule = Blueprint("schedule", __name__, template_folder="template")

@schedule.route('/anniversaries', methods=['GET'])
def get_anniversaries():
    anniversaries = [
        {
            "id": 1,
            "name": "생일",
            "date": "2022-05-20"
        },
        {
            "id": 2,
            "name": "결혼기념일",
            "date": "2022-10-10"
        },
        {
            "id": 3,
            "name": "취업기념일",
            "date": "2022-12-01"
        }
    ]

    response = {
        "anniversaries": anniversaries
    }

    return jsonify(response), 200

@schedule.route('/anniversaries', methods=['POST'])
def add_anniversary():
    data = request.get_json()
    name = data.get('name')
    date = data.get('date')

    # 새로운 기념일 정보 생성
    anniversary = {
        "id": len(anniversaries) + 1,
        "name": name,
        "date": date
    }

    # 기념일 추가
    anniversaries.append(anniversary)

    response = {
        "message": "기념일이 성공적으로 추가되었습니다."
    }
    return jsonify(response), 201