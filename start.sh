#!/bin/bash -i

ENV_NAME="ldm"
ENV_FILE="environment.yaml"

if ! conda env list | grep ".*${ENV_NAME}.*" >/dev/null 2>&1; then
    printf "Could not find conda env: ${ENV_NAME} ... creating ... \n\n"
    conda env create -f $ENV_FILE
fi

if [ -d "/home/featurize/data/" ]; then
    echo "数据集已下载"
    else
    featurize dataset download bd3b3900-c351-49d8-833b-f7941a707b92
fi


source /environment/miniconda3/bin/activate $ENV_NAME
conda info | grep active
python prepare_env.py

conda deactivate
ls -l /bin/sh

unset http_proxy
unset https_proxy
unset all_proxy

source /environment/miniconda3/bin/activate $ENV_NAME
conda info | grep active

python launch.py