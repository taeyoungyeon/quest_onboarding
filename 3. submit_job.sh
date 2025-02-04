#!/bin/bash
#SBATCH --job-name=quest_checkpoint
#SBATCH --output=checkpoint_job.log
#SBATCH --error=checkpoint_job.err
#SBATCH --time=02:00:00   # Set maximum job run time (hh:mm:ss)
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1

# Load necessary modules (adjust as needed)
module load python/3.8

# If using a Conda environment, uncomment and modify the next line:
# source ~/anaconda3/bin/activate quest_env

# Run the Python script for checkpointing
python3 example1_checkpoint.py
