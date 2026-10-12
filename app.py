from flask import Flask
import os

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello from Dockerized Python! The app is running successfully."


if __name__ == "__main__":
    # Bind to 0.0.0.0 to make it accessible outside the container
    app.run(host="0.0.0.0", port=5000)
