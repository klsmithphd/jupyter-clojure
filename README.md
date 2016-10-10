# jupyter-clojure
A Docker image for a Jupyter notebook with a Clojure kernel

This image uses the [clj-jupyter](https://github.com/achesnais/clj-jupyter) Clojure kernel developed by [Antoine Chesnais](https://github.com/achesnais).

See also [jupyter-clojure-docker](https://github.com/kxxoling/jupyter-clojure-docker) for a similar approach using a different Clojure kernel.

## Usage
You can run a container in detached mode to spin up a Jupyter web instance and then work with either Python3 or Clojure notebook kernels:

    docker run -d -p 8888:8888 rkdnio/jupyter-clojure

More likely than not, however, you'll want to be able to mount some directory
from your host filesystem as a volume so that you can access additional
files from within the notebook

    docker run -d -p 8888:8888 -v "$PWD":/home/jupyter rkdnio/jupyter-clojure


## License
See [UNLICENSE](UNLICENSE)
