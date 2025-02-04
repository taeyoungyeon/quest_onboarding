# Quest Quick Start Guide for Automated Job Restart and Monitoring

Quest is Northwestern University's high-performance computing system designed for students, researchers, and staff. It provides a robust environment for running long-running and resource-intensive jobs. The system is managed through SLURM and supports a variety of tools and workflows including file transfer, user guides, and video tutorials. For detailed documentation and tutorials, please refer to these resources:

- **Quest Documentation:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505)
- **Quest User Guide and Video Tutorials:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=2004](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=2004)
- **Logging into Quest Tutorial:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505)
- **Transferring Files on Quest:** [https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1535](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1535)

This guide provides example scripts and instructions to help you run and monitor jobs on Quest using SLURM. The repository includes the following files:

- **training_with_checkpoint.py**  
  A Python script that implements automated job restart with checkpointing. It saves progress every 10 steps and resumes from the last checkpoint if interrupted.
- **submit_job.sh**  
  A SLURM job submission script that submits a job (e.g., running `training_with_checkpoint.py`). Adjust this script as needed for your environment.
- **watchdog.sh**  
  A SLURM-based watchdog script that submits the job using `sbatch`, monitors its status with SLURM commands (such as `squeue` and `sacct`), and automatically resubmits it if the job fails or does not finish with a "COMPLETED" status.

---

## Table of Contents

- [About Quest](#about-quest)
- [Files Overview](#files-overview)
- [Usage Instructions](#usage-instructions)
- [Additional Notes](#additional-notes)

---

## About Quest

Quest is designed to offer a reliable computing environment with robust support for running complex and long-running computational jobs. It comes with comprehensive documentation and support materials:

- **Documentation:** Detailed guides on Quest features and best practices are available via the Northwestern IT Knowledge Base.
- **User Guides and Tutorials:** New users can refer to the Quest User Guide, video tutorials, and a quick-start video on logging in.
- **File Transfer:** Instructions on transferring files to and from Quest are provided in the Knowledge Base.

These resources help ensure that you can effectively use Quest for your computational work.

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

1. **Upload Files to Quest**  
  1) you can git clone your directory inside the Quest.
  2) Transfer all dataset files to your Quest working directory using SCP or SFTP.

2. **Log in to Quest**  
   Connect via SSH by running:  
  ```
    ssh your_username@quest.northwestern.edu
  ```

Replace `your_username` with your actual Quest username (Northwestern NetID).

3. **Set Execution Permissions**  
In your working directory, run:  
chmod +x 1. training_with_checkpoint.py 2. submit_job.sh 3. watchdog.sh

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
