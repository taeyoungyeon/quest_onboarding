#!/usr/bin/env python3
"""
Example 1: Automated Job Restart with Checkpointing

This script simulates a long-running job. It saves progress every 10 steps to a 
checkpoint file. If the job is interrupted (e.g., at step 51 for simulation), it 
can be re-run to resume from the last checkpoint.
"""

import os
import time

# File used to store the checkpoint (last completed step)
CHECKPOINT_FILE = 'checkpoint.txt'

def load_checkpoint():
    """Load the last completed step from the checkpoint file if it exists."""
    if os.path.exists(CHECKPOINT_FILE):
        with open(CHECKPOINT_FILE, 'r') as file:
            checkpoint = file.read().strip()
            try:
                step = int(checkpoint)
                print(f"Resuming from checkpoint: step {step}")
                return step
            except ValueError:
                print("Invalid checkpoint data. Starting from step 0.")
    return 0

def save_checkpoint(step):
    """Save the current step to the checkpoint file."""
    with open(CHECKPOINT_FILE, 'w') as file:
        file.write(str(step))
    print(f"Checkpoint saved at step {step}")

def perform_job(start_step):
    """
    Simulate a long-running job by processing a series of steps.
    Replace the sleep and print statements with your actual work.
    """
    total_steps = 100  # Total number of steps in the job
    for step in range(start_step, total_steps):
        print(f"Processing step {step + 1}/{total_steps}")
        time.sleep(1)  # Simulate work

        # Save a checkpoint every 10 steps
        if (step + 1) % 10 == 0:
            save_checkpoint(step + 1)

        # Simulate an interruption at step 51 for demonstration purposes
        if step == 50:
            print("Simulated interruption at step 51!")
            return

def main():
    start_step = load_checkpoint()
    perform_job(start_step)
    # On successful completion, remove the checkpoint file
    if os.path.exists(CHECKPOINT_FILE):
        os.remove(CHECKPOINT_FILE)
        print("Job completed successfully. Checkpoint file removed.")

if __name__ == '__main__':
    main()
