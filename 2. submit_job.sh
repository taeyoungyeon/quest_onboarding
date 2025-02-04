#!/bin/bash
# -------- SETTINGS ------------
# Account	--account=<account> -A <account>	Required: Not set by default
# account means our project allocation
#SBATCH --account=p32139

# Partition/queue	--partition=<partition>	Required: Not set by default
#SBATCH --partition=short

# Wall time limit	--time=<hh:mm:ss> -t<hh:mm:ss>	Required: Not set by default
#SBATCH --time=02:00:00   

#SBATCH --job-name=quest_checkpoint

# partition has several attributes. for training models, you should use gregpu for it. 
# Refer https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1549 for details.
#SBATCH --nodes=1
#SBATCH --ntasks=1

# There are lots of useful options.
# Refer https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1964 for details.
#SBATCH --output=checkpoint_job.log
#SBATCH --error=checkpoint_job.err

# Request event notification	--mail-type=<events>
# Note: multiple mail-type requests may be specified in a comma separated list: --mail-type=BEGIN,END,FAIL	Optional: Not set by default
# Email address	--mail-user=<email address>	Optional: Not set by default

# -------- SETTINGS ------------


# Below are scripts for running
# If using a Conda environment or settings, uncomment and modify the next line:
# conda activate envname

# Run the Python script for checkpointing
python3 1. training_with_checkpoint.py
