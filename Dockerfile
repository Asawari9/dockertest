FROM python:3.9-slim-buster

WORKDIR /app

# Install Git (if not already present in the base image)
RUN apt-get update && apt-get install -y --no-install-recommends git

# Clone the specific version of the repository
ARG REPO_URL=https://github.com/Asawari9/dockertest
ARG TARGET_VERSION=master # Default branch, we'll override this

RUN git clone --depth 1 --branch $TARGET_VERSION $REPO_URL .

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Run tests
CMD ["pytest", "tests"]
