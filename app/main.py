from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"status": "ok", "version": os.getenv("APP_VERSION", "1.0.0")})

@app.route("/health")
def health():
    return jsonify({"healthy": True})

@app.route("/add/<int:a>/<int:b>")
def add(a, b):
    return jsonify({"result": a + b})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)