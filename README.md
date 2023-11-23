This is a Docker image used to serve a Single Page App (pure frontend javascript) using nginx with pushState support.

This is a fork of [SocialEngine/docker-nginx-spa](https://github.com/SocialEngine/docker-nginx-spa). Changes include:
- armv7/armv6/amd64 support (not just amd64)
- Using `nginx:alpine-stable` as base
- Removed ability to configure the site using env vars

## Supported tags and `Dockerfile` links

-	[`latest` (*Dockerfile*)][latest]

## Included on top of [base][base image] nginx image

- [pushState][push state] support. Every request is routed to `/app/index.html`. Useful for the clean urls (no `!#`)

# App Setup

This docker image is built for `index.html` file being in the `/app` directory. `pushState` is enabled.

At a minimum, you will want this in your `Dockerfile`:

```Dockerfile
FROM ghcr.io/nikeee/docker-nginx-spa:latest

COPY build/ /app
COPY index.html /app/index.html
```

Then you can build & run your app in the docker container. It will be served by a nginx static server.
