#!/bin/bash
#SBATCH -c 40
#SBATCH --gres=gpu:4
#SBATCH --partition=compsci-gpu
#SBATCH --nodelist=gpu-compute4

rm -rf ~/.cache/torch_extensions

start=`date +%s`

set -ex

python3 search_methods/astar.py --states data/cube3/test/data_0.pkl --model saved_models/cube3/current/ --env cube3 --weight 0.6 --batch_size 100 --results_dir results/cube3_intermediate_reward/ --language cpp --nnet_batch_size 100

end=`date +%s`
runtime=$((end-start))
