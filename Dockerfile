# 1. Use the official lightweight Python image
FROM python:3.9-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the dependencies file to the working directory
COPY requirements.txt .

# 4. Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY app.py .

# 6. Expose the port the app runs on
EXPOSE 5000

# 7. Define the command to run the application
CMD ["python", "app.py"]
