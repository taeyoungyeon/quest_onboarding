#!/bin/bash
# watchdog.sh - SLURM job watchdog script for Quest
# This script submits the job using sbatch and monitors its status via SLURM.
# If the job fails or does not complete successfully, it will automatically resubmit it.

# Set the job submission script to run (ensure proper quoting for filenames with spaces)
JOB_SCRIPT="2. submit_job.sh"
# Set the log file for watchdog activity
LOG_FILE="watchdog.log"

while true; do
    # Submit the job and capture the output (e.g., "Submitted batch job 123456")
    SUBMIT_OUTPUT=$(sbatch "$JOB_SCRIPT")
    # Extract the job ID (assuming it's the fourth field)
    JOB_ID=$(echo $SUBMIT_OUTPUT | awk '{print $4}')
    echo "$(date): Submitted job $JOB_ID" >> "$LOG_FILE"

    # Monitor the job until it finishes
    while squeue -j "$JOB_ID" > /dev/null 2>&1 && squeue -j "$JOB_ID" | grep -q "$JOB_ID"; do
        sleep 10
    done

    # Allow time for SLURM to update job accounting information
    sleep 30

    # Retrieve the final state of the job using sacct
    JOB_STATE=$(sacct -j "$JOB_ID" --format=State --noheader | head -n 1 | tr -d ' ')
    echo "$(date): Job $JOB_ID finished with state: $JOB_STATE" >> "$LOG_FILE"

    # If the job completed successfully, exit the watchdog script
    if [[ "$JOB_STATE" == "COMPLETED" ]]; then
        echo "$(date): Job completed successfully. Exiting watchdog." >> "$LOG_FILE"
        exit 0
    else
        echo "$(date): Job did not complete successfully. Resubmitting..." >> "$LOG_FILE"
    fi
done
