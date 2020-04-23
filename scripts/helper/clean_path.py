#!/usr/bin/env python
"""
helper script for bash setup scripts, which echoes a path with any miniconda elements removed
"""
import os
print(":".join([d for d in os.getenv("PATH").split(":") if "miniconda" not in d]))

