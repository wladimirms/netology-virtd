FROM nginx:1.21.1

RUN rm -rf /usr/share/nginx/html/*

COPY /index.html /usr/share/nginx/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]