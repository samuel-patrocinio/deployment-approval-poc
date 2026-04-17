FROM busybox:1
ARG API_URL
WORKDIR /www
COPY index.html .
RUN sed -i "s|__API_URL__|${API_URL}|g" index.html
EXPOSE 80
ENTRYPOINT ["busybox", "httpd", "-f", "-v", "-p", "80", "-h", "/www"]
