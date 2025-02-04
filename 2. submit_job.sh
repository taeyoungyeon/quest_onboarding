#!/bin/bash
# account means our project allocation
#SBATCH --account=p32139
#SBATCH --job-name=quest_checkpoint
#SBATCH --output=checkpoint_job.log
#SBATCH --error=checkpoint_job.err

# partition has several attributes. for training models, you should use gregpu for it. 
# refer https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1549 for details.
#SBATCH --time=02:00:00   
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1

# If using a Conda environment or settings, uncomment and modify the next line:
# conda activate envname

# Run the Python script for checkpointing
python3 1. training_with_checkpoint.py
