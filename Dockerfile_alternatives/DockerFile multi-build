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