# Quest Quick Start Guide for Automated Job Restart and Monitoring

Quest is Northwestern University's high-performance computing system designed for students, researchers, and staff. It provides a robust environment for running long-running and resource-intensive jobs. The system is managed through SLURM and supports a variety of tools and workflows including file transfer, user guides, and video tutorials. For detailed documentation and tutorials, please refer to these resources:

- **Quest Documentation:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505)
- **Quest User Guide and Video Tutorials:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=2004](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=2004)
- **Logging into Quest Tutorial:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505)
- **Transferring Files on Quest:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1535](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1535)

You can manage your scripts in /projects/p32139 (our allocation name), which provides you with 2TB of space. In your home directory (/home/your_net_id), you have 80GB of space available. You can also add your dependencies or local settings (such as SSH keys) there. All tasks are managed by submitting jobs, and you can test your settings locally before submitting jobs for GPU usage.

This guide provides example scripts and instructions to help you run and monitor jobs on Quest using SLURM. The repository includes the following files:

- **training_with_checkpoint.py**  
  A Python script that implements automated job restart with checkpointing. It saves progress every 10 steps and resumes from the last checkpoint if interrupted.
- **submit_job.sh**  
  A SLURM job submission script that submits a job (e.g., running `training_with_checkpoint.py`). Adjust this script as needed for your environment.
- **watchdog.sh**  
  A SLURM-based watchdog script that submits the job using `sbatch`, monitors its status with SLURM commands (such as `squeue` and `sacct`), and automatically resubmits it if the job fails or does not finish with a "COMPLETED" status.

---

## Table of Contents

- [Files Overview](#files-overview)
- [Usage Instructions](#usage-instructions)
- [Additional Notes](#additional-notes)

---

## Files Overview

- **training_with_checkpoint.py**  
  Implements checkpointing logic:
  - Saves the current step to a file every 10 steps.
  - On restart, reads the checkpoint file and resumes processing.

- **submit_job.sh**  
  A SLURM submission script that loads required modules and executes the Python script (e.g., `training_with_checkpoint.py`).

- **watchdog.sh**  
  Monitors the submitted job by:
  - Submitting the job using `sbatch`.
  - Polling the job status using SLURM commands (`squeue` and `sacct`).
  - Resubmitting the job if it does not complete successfully.

---

## Usage Instructions

1. **Log in to Quest**  
   Connect via SSH by running:  
  ```
    ssh your_username@quest.northwestern.edu
  ```

Replace `your_username` with your actual Quest username (Northwestern NetID) and password would be your NetID Password.

2. **Upload Files to Quest**  
For this repo, it is public so you can just clone and take a try. You should be allocated first to run script in the Quest Server. 
You can git clone your directory inside the Quest, and transfer all dataset files to your Quest working directory using SCP or SFTP.

Try to use FileZilla(https://filezilla-project.org/) for easy file transfer. 

3. **Set Execution Permissions**  
For testing this directory, run:  
chmod +x 1. training_with_checkpoint.py 2. submit_job.sh 3. watchdog.sh

You also need to change your job script's mode for execution.

4. **Submit a Job**  
To run the checkpointing job, submit it via SLURM with:  
sbatch 2. submit_job.sh

This will execute `1. training_with_checkpoint.py` under SLURM control.

5. **Monitor and Auto-Resubmit with the Watchdog**  
To automatically monitor the job and resubmit if it fails, run:  
./3. watchdog.sh

The watchdog script submits the job via `2. submit_job.sh`, monitors its status using SLURM commands, and resubmits it if the final state is not "COMPLETED".

---

## Additional Notes

- **Customization:**  
Adjust the Python scripts and SLURM submission parameters as needed for your specific application or computational environment.

- **Environment Modules:**  
If you use Conda or another environment manager, ensure the required modules and environment are properly loaded in `submit_job.sh`.

- **Troubleshooting:**  
Check the log files (e.g., `checkpoint_job.log`, `checkpoint_job.err`, and `watchdog.log`) for details on job execution and errors. Use SLURM commands (`squeue`, `sacct`, `scontrol`) to monitor job status and debug issues.
