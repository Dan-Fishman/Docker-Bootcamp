# Python Base Image
FROM python:latest

# Set Workdir
WORKDIR /app

# Copy Source Code
COPY . .

# Install Project Requirements
RUN pip install --no-cache-dir -r requirements.txt --upgrade pip && chmod +x entrypoint.sh

# Make Migrations
ENTRYPOINT [ "./entrypoint.sh" ]

# Start Server
CMD ["python", "manage.py","runserver", "0.0.0.0:8000"]

# Our server uses port 8000
EXPOSE 8000