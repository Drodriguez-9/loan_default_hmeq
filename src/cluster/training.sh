#!/bin/bash
### General options
### -- specify queue --
#BSUB -q gpuv100
#BSUB -gpu "num=1:mode=exclusive_process"
### -- set the job Name --
#BSUB -J NoBatching
### -- ask for number of cores (default: 1) --
#BSUB -n 4
### -- specify that the cores must be on the same host --
#BSUB -R "span[hosts=1]"
### -- specify that we need 4GB of memory per core/slot --
#BSUB -R "rusage[mem=4GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot --
#BSUB -M 5GB
### -- set walltime limit: hh:mm --
#BSUB -W 00:20
### -- Specify the output and error file. %J is the job-id --
#BSUB -oo /zhome/58/f/181392/DTU/MBML/european_vote_analysis/src/cluster/Output_%J.out
#BSUB -eo /zhome/58/f/181392/DTU/MBML/european_vote_analysis/src/cluster/Error_%J.err

# Load necessary modules (assuming you have these modules available)
module load cuda/12.1  # Load CUDA if you are using GPU

# Activate your virtual environment
source /zhome/58/f/181392/DTU/MBML/european_vote_analysis/.venv/bin/activate

# Run your training script
python /zhome/58/f/181392/DTU/MBML/european_vote_analysis/src/models/train_model.py --cuda --n_steps 40000 --batch-size 1000 --learning-rate 0.01 --log_interval 1000