#!/bin/bash
#SBATCH --account=p32139
#SBATCH --partition=gengpu
#SBATCH --job-name=mimik_training           # Job name
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=1                      # Number of tasks
#SBATCH --cpus-per-task=8               # Number of CPU cores per task
#SBATCH --gres=gpu:a100:2               
#SBATCH --mem=64G                       # Memory allocation
#SBATCH --time=48:00:00                 # Time limit (HH:MM:SS)
#SBATCH --output=quest_p_logs/%j/output.log # Output file
#SBATCH --error=quest_p_logs/%j/error.log # Error Log file

# Load Conda environment
source ~/.bashrc                         
conda activate mobileposer

# Check if PyTorch can see CUDA
echo "Checking PyTorch CUDA detection:"
python -c "import torch; print('CUDA available:', torch.cuda.is_available()); print('CUDA version:', torch.version.cuda if torch.cuda.is_available() else 'N/A'); print('GPU count:', torch.cuda.device_count()); print('GPU name:', torch.cuda.get_device_name(0) if torch.cuda.device_count() > 0 else 'N/A')"
nvidia-smi
# Set working directory 
cd /projects/p32139/Mimik_modeling

python train.py --config ./options/train_config.yaml