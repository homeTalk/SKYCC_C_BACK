from flask import Flask, jsonify
from flask_restful import Resource, reqparse

# parse request data(i.e. querystring or POST form encoded data)
parser = reqparse.RequestParser()
parser.add_argument('itemId')

class MissionAPI(Resource):
    # GET: 책 장바구니 목록 불러오기
    def get(self):
        ...
        return jsonify({'books': books})

    # POST: 책 장바구니에 추가하기
    def post(self):
        ...
        return jsonify({'msg': '책바구니에 책을 담았습니다✨'})

    # DELETE: 책 장바구니에서 삭제하기
    def delete(self):
        itemId = request.form['itemId']
        ...
        return jsonify({'msg': '책바구니에서 책을 뺐습니다💨'})