# CS Slurm Cluster Guide

## Overview

The CS Slurm Cluster provides computing resources with 4 A40 GPUs and 2TB of storage space.

## Documentation

- [Comprehensive SLURM Documentation (PDF)](./Slrum/SLURM_Documentation-2.pdf)

## Storage

You can use up to 2TB of storage in: /hemera-storage2/abj8130

## Data Transfer

For the Slurm cluster, you'll typically need to transfer data from your local machine to the server:

1. Use SFTP to connect to the server
2. Use commands like `mget` and `get` to pull data from your local machine

## Job Management

Standard Slurm commands apply:
- `sbatch`: Submit a job
- `squeue`: Check job status
- `scancel`: Cancel jobs
- `sinfo`: Check node information

## Getting Help

For assistance with the CS Slurm Cluster, please contact the administrator or Professor Karan Ahuja.