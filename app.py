from flask import Flask, request, jsonify
from api_db import select, db_connect

connection = db_connect()

app = Flask(__name__)

@app.route('/',methods=["GET" ])
def get_home():
    return "Recipe API"

@app.route('/recipes', methods=["GET"])
def recipes():
    try:
        params = request.args
        search_term = request.args.get("search")
        # TO DO: implement search
        query = """SELECT * FROM all_recipes;"""
        data = select(query, (), connection)
        return jsonify(data), 200
    except Exception as e:
        raise Exception(f'Error retrieving data: {e.args[0]}')
    
@app.route('/recipes/<int:recipe_id>', methods=["GET", "POST"])
def recipes_id(recipe_id):
    """This endpoint returns a specified recipe by ID with a GET request. 
    """
    method = request.method
    if method == 'GET':
        query = 'SELECT * FROM all_recipes WHERE id = %s;'
        data = select(query, (recipe_id,), connection)
        return jsonify(data)



    
