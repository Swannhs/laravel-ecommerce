FROM nginx:alpine

COPY docker/prod/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY public /var/www/html/public

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
