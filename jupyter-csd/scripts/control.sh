#!/bin/bash
CMD=$1

ANACONDA_BIN_DIR=$(dirname "${CDH_PYTHON}")
export PATH=$ANACONDA_BIN_DIR:$PATH

case $CMD in
  (start)
    echo "Starting the Jupyter Notebook on port [$JPY_NOTEBOOK_PORT]"
    exec $ANACONDA_BIN_DIR/jupyter notebook --no-browser --ip 0.0.0.0 --port $JPY_NOTEBOOK_PORT
    ;;
  (*)
    echo "Don't understand [$CMD]"
    ;;
esac
