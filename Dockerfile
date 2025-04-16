FROM python:3.9-slim-buster

WORKDIR /app

# Install Git (if not already present in the base image)
RUN apt-get update && apt-get install -y --no-install-recommends git

# Clone the specific version of the repository
ARG REPO_URL=https://github.com/Asawari9/dockertest

RUN git clone  $REPO_URL .

#ARG TARGET_VERSION=v1.1.0
#RUN git checkout $TARGET_VERSION

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Run tests
CMD ["pytest", "tests/test_app.py"]
