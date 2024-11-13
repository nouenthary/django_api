# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory inscide the container
WORKDIR /app

# Install system dependencies and libraries
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && apt-get clean

# Copy the current directory contents into the container
COPY . /app/

# Install Python dependencies (requirements.txt should be in the project folder)
RUN pip install --upgrade pip && pip install -r requirements.txt
RUN pip install gunicorn
# Expose the port that Django will run on
EXPOSE 8000

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Run the Django application when the container starts
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]