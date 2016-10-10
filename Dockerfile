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
    && pip3 --no-cache-dir install jupyter \
    && cd /tmp \
    && git clone https://github.com/achesnais/clj-jupyter.git \
    && cd clj-jupyter \
    && lein do clean, uberjar \
    && cp target/IClojure.jar resources/clj_jupyter \
    && sed -i 's/HOME\/Library\/Jupyter/\/usr\/local\/share\/jupyter/' resources/clj_jupyter/kernel.json \
    && jupyter kernelspec install resources/clj_jupyter --name clojure \
    && rm -rf /tmp/clj-jupyter \
    && adduser -D -s /bin/false jupyter

WORKDIR /home/jupyter
EXPOSE 8888
USER jupyter
CMD ["jupyter", "notebook", "--ip='*'"]
