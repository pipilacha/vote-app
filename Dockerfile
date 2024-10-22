# Using official python runtime base image
FROM python:2.7-alpine

# Set the application directory
WORKDIR /app

# Install our requirements.txt
ADD requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy our code from the current folder to /app inside the container
ADD . /app

# Make port 80 available for links and/or publish
ENV PORT=80
EXPOSE ${PORT}

# Define our command to be run when launching the container
CMD ["sh", "-c", "gunicorn app:app -b 0.0.0.0:$PORT --log-file - --access-logfile - --workers 4 --keep-alive 0"]
