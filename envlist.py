#!/usr/bin/env python3

import hickle
import sys

ENVIRONMENT_COUNT = 64
envs = ["cenv" + str(i) for i in range(ENVIRONMENT_COUNT)]

if len(sys.argv) > 2:
    print("Please only have 0 or 1 arguments")
    exit(1)

if len(sys.argv) == 2:
    print(f"First argument {sys.argv[1]}")

if len(sys.argv) == 1:
    print("No arguments")
