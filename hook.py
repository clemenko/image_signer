from flask import Flask, render_template, request, jsonify, redirect, url_for
import os, requests, subprocess

app = Flask(__name__)
server_name = os.getenv('HOSTNAME')

@app.route('/', methods=['GET', 'POST'])
def default():
    if request.method == 'POST'
        #do the post thingy here
    return render_template('index.html')

@app.route('/signing', methods=['POST'])
def sign():
    #find a way to accept url/sign?source=clemenko/build,dest=clemenko/signed
    return_string="Pulling from " + source + " and pushing to " + dest + "."
    return return_string, 200

#d_pull = subprocess.check_output(['python', 'py2.py', '-i', 'test.txt'])
if __name__ == '__main__':
    app.run(host='0.0.0.0')
