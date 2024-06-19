from flask import Flask, request, redirect, jsonify, Response
import json
import psycopg2

app = Flask(__name__)

# Function to connect to postgresql database
def get_db_connection():
    conn = psycopg2.connect(host='localhost',
                            database='FTSP_app',
                            user='postgres',
                            password='postgresql')
    return conn

# Function to get JSON response based on mode
def get_json_response(json_data):
    vehiclemode = json_data['vehiclemode']
    mode = json_data['mode']
    topn = json_data['topn']   

    file_path = f"vehiclemode_{vehiclemode}_mode_{mode}_topn_{topn}.json"
    
    try:
        with open(file_path, 'r') as file:
            json_response = json.load(file)
        return json_response
    except FileNotFoundError:
        return {'error': f'File for mode {mode} not found'}
    except Exception as e:
        return {'error': f'An error occurred: {str(e)}'}

# Generator function to stream JSON response
def generate_json_response(json_data):
    response = get_json_response(json_data)
    yield json.dumps(response)

# Flask endpoint to process JSON data
@app.route('/getrecommendation', methods=['POST'])
def process_json_data():
    try:
        json_data_to_post = request.json
        return Response(generate_json_response(json_data_to_post), content_type='application/json')
    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'})
    
# Flask endpoint to add new user to database
@app.route('/register', methods=('GET', 'POST'))
def create():
    try:
        json_data = request.json
        userid = json_data['userid']
        name = json_data['name']
        age = json_data['age']
        gender = json_data['gender']    
        password = json_data['password']
        email = json_data['email']
        birthdate = json_data['birthdate']
        mobilenumber = json_data['mobilenumber']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT EXISTS (SELECT * FROM public.userprofile where email='{}')".format(email))
        userexists = cur.fetchall()
        if userexists[0][0] == False:
            cur.execute('INSERT INTO public.userprofile ("User ID", "Name", age, gender, password, email, birthdate, mobilenumber)'
                        'VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                        (userid, name, age, gender, password, email, birthdate, mobilenumber))
            conn.commit()
            cur.close()
            conn.close()
            return jsonify({'status':'User added successfully'})
        else:
            cur.close()
            conn.close()
            return jsonify({'status':'Email has already been used'})
    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'})

@app.route('/login', methods=('GET', 'POST'))
def read():  
    try:
        json_data = request.json
        password = json_data['password']
        email = json_data['email']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT EXISTS (SELECT * FROM public.userprofile where email='{}' and password='{}')".format(email, password)) 
        userexists = cur.fetchall()
        if userexists[0][0] == True:
            cur.execute("""SELECT "User ID" from public.userprofile where email='{}'""".format(email))
            uid = cur.fetchone()[0]
            cur.close()
            conn.close()
            return jsonify({'uid':uid, 'status':'Login success'})
        else:
            cur.close()
            conn.close()
            return jsonify({'status':'Incorrect email or password'})
    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'})
    
@app.route('/forgetpassword', methods=('GET', 'POST'))
def check():
    try:
        json_data = request.json
        email = json_data['email']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT EXISTS (SELECT * FROM public.userprofile where email='{}')".format(email))
        userexists = cur.fetchall()
        cur.close()
        conn.close()
        if userexists[0][0] == False:
            return jsonify({'status':'Email is not registered'})
        else:
            return jsonify({'status':'Registered email found'})
    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'})
    
@app.route('/newpassword', methods=('GET', 'POST'))
def get_password():
    try:
        json_data = request.json
        password = json_data['password']
        email = json_data['email'] 

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT password FROM public.userprofile where email='{}'".format(email))
        current_password = cur.fetchone()[0]
        if password != current_password:
            cur.execute("UPDATE public.userprofile SET password='{}' where email='{}'".format(password, email))
            conn.commit()
            cur.close()
            conn.close()
            return jsonify({'status':'Password has been updated'})
        else:
            cur.close()
            conn.close()
            return jsonify({'status':'New password is the same as current password'})
    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'})

@app.route('/test', methods=('GET', 'POST'))
def test():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT EXISTS (SELECT * FROM public.userprofile where email='Johnny@gmail.com')")
    truefalse = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(truefalse[0][0])



if __name__ == '__main__':
    app.run(host='127.0.0.1', port=7687, debug=False)
