import json
import sqlite3


def lambda_handler(event, context):
    response = {
        "statusCode": 400,
        "body": None
    }

    conn = sqlite3.connect('/tmp/example.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE stocks
             (date text, trans text, symbol text, qty real, price real)''')

    c.execute("INSERT INTO stocks VALUES ('2006-01-05','BUY','RHAT',100,35.14)")
    conn.commit()

    c.execute('SELECT * FROM stocks WHERE symbol=\'RHAT\'')
    response["statusCode"] = 200
    response["body"] = json.dumps(c.fetchone())

    conn.close()

    return response
