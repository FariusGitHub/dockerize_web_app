# ORIGINAL WAY
# FROM python:3.7-alpine
# WORKDIR /code
# ENV FLASK_APP app.py
# ENV FLASK_RUN_HOST 0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# COPY . .
# CMD ["flask", "--debug", "run"]

# SECOND WAY
# FROM python:3.7-alpine
# WORKDIR /code
# ENV FLASK_APP app.py
# ENV FLASK_RUN_HOST 0.0.0.0
# COPY requirements.txt requirements.txt
# RUN apk add --no-cache gcc musl-dev linux-headers && \
#     pip install --no-cache -r requirements.txt && \
#     apk del gcc musl-dev linux-headers
# COPY . .
# CMD ["flask", "--debug", "run"]

# THIRD WAY
# FROM python:3.7-slim-buster
# WORKDIR /code
# ENV FLASK_APP app.py
# ENV FLASK_RUN_HOST 0.0.0.0
# COPY requirements.txt requirements.txt
# RUN apt-get update && apt-get install -y gcc && \
#     pip install --no-cache-dir -r requirements.txt && \
#     apt-get remove -y gcc && apt-get autoremove -y && \
#     rm -rf /var/lib/apt/lists/*
# COPY . .
# CMD ["flask", "--debug", "run"]


# FOURTH WAY
# Stage 1
FROM python:3.7-alpine as builder
WORKDIR /code
COPY requirements.txt requirements.txt
RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip install --user --no-cache-dir -r requirements.txt
COPY . .

# Stage 2
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
COPY --from=builder /root/.local /root/.local
COPY --from=builder /code /code
ENV PATH=/root/.local/bin:$PATH
CMD ["flask", "--debug", "run"]

