# Use Python 3 official image as base
FROM python:3

# Set working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt .

# Install required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app directory content into the container
COPY . .

# Set environment variables
ENV DB_USERNAME=postgres \
    DB_PASSWORD=9xZAuUQyB2 \
    DB_HOST=postgres-postgresql.default.svc.cluster.local \
    DB_PORT=5432 \
    DB_NAME=postgres

# Expose the app port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]

#add arbitrary comment
