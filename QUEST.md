# Quest HPC Environment Guide

## Overview

Quest is Northwestern University's high-performance computing system designed for students, researchers, and staff. It provides a robust environment for running long-running and resource-intensive jobs. The system is managed through SLURM and supports a variety of tools and workflows.

## Available Allocations

- **b1042**: Genomics Compute Cluster
  - 40TB storage
  - Data purged after 30 days of inactivity
  - Maximum 4 A100 GPUs

- **b1218**: Regular allocation
  - 10TB storage
  - Maximum 4 A100 GPUs

- **p32139**: Independent Study allocation
  - 2TB storage
  - Maximum 4 A100 GPUs

## Requesting Allocation Access

Use this link to request access:
https://app.smartsheet.com/b/form/797775d810274db5889b5199c4260328

- For pXXXXX allocations: List Professor Karan Ahuja as Allocation manager and PI
- For bXXXX allocations: List Bryan A Pardo (bap335) as Allocation manager and Predrag S Bundalo (psb996) as PI

## Storage Locations

You can manage your scripts in:
- `/projects/pXXXXX` or `/projects/bXXXX` (allocation storage)
- `/home/your_net_id` (80GB personal storage for dependencies and settings)

## Usage Instructions

1. **Log in to Quest**  
   Connect via SSH: ssh your_username@quest.northwestern.edu

Use your Northwestern NetID and password.

2. **Upload Files to Quest**  
Use FileZilla (https://filezilla-project.org/) or git clone for code repositories.

3. **Set Execution Permissions**
    chmod +x your_script.py your_job.sh your_watchdog.sh

4. **Submit a Job**
sbatch submit_job.sh

5. **Monitor Jobs**
squeue -u your_username
sacct -u your_username

## Additional Resources

- [Quest Documentation](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=505)
- [Quest User Guide and Video Tutorials](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=2004)
- [Transferring Files on Quest](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1535)
- [GCS Cluster of Quest](https://www.it.northwestern.edu/departments/it-services-support/research/computing/quest/genomics-compute-cluster.html)
- [GPUs on Quest](https://services.northwestern.edu/TDClient/30/Portal/KB/ArticleDet?ID=1112)
