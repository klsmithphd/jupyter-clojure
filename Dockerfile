FROM clojure:alpine
MAINTAINER Kenneth Smith <ken.smith@2scientists.net>

RUN apk add --no-cache \
    g++ \
    git \
    libzmq \
    linux-headers \
    musl-dev \
    python3 \
    python3-dev \
    && pip3 --no-cache-dir install jupyter 
