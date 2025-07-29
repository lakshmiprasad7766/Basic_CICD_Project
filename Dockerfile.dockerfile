# Use Python base image
FROM python:3.9-slim

# Set the working directory inside container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY . .

# Command to run the application
CMD ["python", "app.py"]
