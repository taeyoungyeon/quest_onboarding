#!/usr/bin/env python3
"""
Example 2: Simulated Failure Job Example

This script simulates a job that fails intentionally after a short period.
It is used to test the watchdog script that monitors and resubmits failed jobs.
"""

import time
import sys

def main():
    print("Starting simulated failure job...")
    for i in range(1, 6):
        print(f"Iteration {i}: Working...")
        time.sleep(2)  # Simulate work delay
    print("Intentional failure triggered.")
    sys.exit(1)  # Exit with a non-zero status to indicate failure

if __name__ == '__main__':
    main()
