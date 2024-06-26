FROM nginx:stable-alpine
LABEL maintainer="Niklas Mollenhauer <nikeee@outlook.com>"

# This tool converts env vars into json to be injected into the config
ADD https://s3.amazonaws.com/se-com-docs/bins/json_env /usr/local/bin/
RUN chmod +x /usr/local/bin/json_env

# Do not start daemon for nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Overwrite default config
COPY nginx-site.conf /etc/nginx/conf.d/default.conf
COPY expires.conf /etc/nginx/conf.d/expires.conf

# Set a path to config file to be written, can be changed at runtime
ENV CONFIG_FILE_PATH /app
RUN mkdir /app \
    && echo "<code>Add your index.html to $CONFIG_FILE_PATH: COPY index.html $CONFIG_FILE_PATH/index.html</code>" > /app/index.html

# Copy our start script
COPY start-container.sh /usr/local/bin/start-container

ENTRYPOINT ["start-container"]
CMD ["nginx"]
