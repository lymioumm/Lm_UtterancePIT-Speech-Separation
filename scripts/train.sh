#!/usr/bin/env bash
# wujian@2018

set -eu

# [ $# -ne 1 ] && echo "format error: $0 <train_conf>" && exit 1

conf=conf/train.yaml

checkpoint=$(grep checkpoint $conf | awk '{print $2}' | sed 's:"::g')

mkdir -p $checkpoint

echo "start training --> $checkpoint ..."

cp $conf $checkpoint/train.yaml

CUDA_VISIBLE_DEVICES=0 python ./run_pit.py --config $conf --num-epoches 50 > $checkpoint/train.log 2>&1 

echo "done"
