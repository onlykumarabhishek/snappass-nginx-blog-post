FROM nginx:stable-alpine

COPY nginx_configuration/nginx.conf /etc/nginx/nginx.conf

COPY nginx_configuration/default.conf /etc/nginx/conf.d/default.conf

COPY nginx_configuration/gcpkm.com.conf /etc/nginx/conf.d/gcpkm.com.conf

COPY nginx_configuration/dhparam.pem /etc/ssl/dhparam.pem

RUN mkdir -p /etc/ssl/gcpkm.com
COPY ssl_certs/gcpkm.com.crt /etc/ssl/gcpkm.com/gcpkm.com.crt
COPY ssl_certs/gcpkm.com.key /etc/ssl/gcpkm.com/gcpkm.com.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
