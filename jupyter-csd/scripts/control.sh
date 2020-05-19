#!/bin/bash
CMD=$1

if [ -z "$ANACONDA_BIN_DIR" ]; then
  ANACONDA_BIN_DIR=$(dirname "${CDH_PYTHON}")
fi
export PATH=$ANACONDA_BIN_DIR:$PATH

case $CMD in
  (start)
    echo "Starting the Jupyter Notebook on port [$JPY_NOTEBOOK_PORT]"
    exec $ANACONDA_BIN_DIR/jupyter notebook --no-browser --ip 0.0.0.0 --port $JPY_NOTEBOOK_PORT $JPY_EXTRA_OPTS
    ;;
  (*)
    echo "Don't understand [$CMD]"
    ;;
esac
