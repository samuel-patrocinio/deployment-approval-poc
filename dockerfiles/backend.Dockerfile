FROM python:3.12-alpine
ARG VERSION
ENV VERSION=${VERSION}
WORKDIR /app
COPY main.py .
EXPOSE 8000
CMD ["python", "main.py"]
