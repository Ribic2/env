FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

# Copy correct config based on environment and other files required to run nginx
COPY ./config/default.dev.conf /etc/nginx/templates/default.dev.conf
COPY ./config/default.production.conf /etc/nginx/templates/default.production.conf
COPY ./html /usr/share/nginx/html/

# Entry point script to select the correct one
COPY /docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]