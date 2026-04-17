FROM alpine:3.19
RUN apk add --no-cache curl
ARG API_URL
ENV API_URL=${API_URL}
WORKDIR /app
COPY main.sh .
ENTRYPOINT ["sh", "main.sh"]
