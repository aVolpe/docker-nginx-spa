FROM nginx:stable-alpine
LABEL maintainer="Niklas Mollenhauer <nikeee@outlook.com>"

# Do not start daemon for nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Overwrite default config
COPY nginx-site.conf /etc/nginx/conf.d/default.conf
COPY expires.conf /etc/nginx/conf.d/expires.conf

# Set a path to config file to be written, can be changed at runtime
RUN mkdir /app
RUN echo "<code>Add your index.html to /app: COPY index.html /app/index.html</code>" > /app/index.html

CMD ["nginx"]
