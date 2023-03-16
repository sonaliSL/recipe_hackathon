from psycopg2 import connect
from psycopg2 import extras
def db_connect():
    try:
        with connect('dbname=recipes user=sonali host=localhost') as connection:
            return connection
    except Exception as e:
        raise Exception(f"Unable to connect to database: {e.args}")

def insert(query, params, connection):
    if connection != None:
        with connection.cursor() as curs:
            try: 
                curs.execute(query, params)
                connection.commit()
                return curs.fetchone()
            except Exception as e:
                connection.rollback()
                print(f"Unable to insert: {e.args[0]}")
    else:
        raise Exception("Error in connection")
    

def select(query, params, connection):
    if connection != None:
        with connection.cursor(cursor_factory=extras.DictCursor) as curs:
            try: 
                curs.execute(query, params)
                return curs.fetchall()
            except Exception as e:
                connection.rollback()
                print(f"Unable to select: {e.args[0]}")
    else:
        raise Exception("Error in connection")