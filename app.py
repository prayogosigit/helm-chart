from flask import Flask, jsonify, request
import json
import platform
from datetime import datetime

app = Flask(__name__)

# 1. /health endpoint for health check
@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "healthy"}), 200

# 2. /date endpoint to return the current date in JSON format
@app.route('/date', methods=['GET'])
def current_date():
    current_date = datetime.now().strftime("%Y-%m-%d")
    return jsonify({"current_date": current_date})

# 3. /print endpoint to return the JSON message exactly as the request body
@app.route('/print', methods=['POST'])
def print_json():
    try:
        data = request.get_json()
        return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400

# 4. /shell endpoint to return the current kernel version in JSON format
@app.route('/shell', methods=['POST'])
def kernel_version():
    kernel_version = platform.release()
    return jsonify({"kernel_version": kernel_version})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

