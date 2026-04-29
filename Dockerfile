FROM alpine:latest

RUN apk add --update --no-cache python3 py3-aiohttp

WORKDIR /app
COPY truenas-gotify.py ./

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost:31662/health || exit 1

CMD ["/usr/bin/env", "python3", "-u", "truenas-gotify.py"]
