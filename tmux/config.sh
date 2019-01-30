#!/bin/bash

workdir=$(cd $(dirname $0) && pwd)

pushd "${workdir}" &> /dev/null

for c in $(ls *.tmux)
do
    source ./"${c}"
done

popd &> /dev/null
