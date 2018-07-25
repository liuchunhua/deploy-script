#!/bin/bash
export PATH=/mnt/d/linux-anaconda3/bin:$PATH
cd /mnt/d/stations-analysis
jupyter notebook --no-browser  > jupyter.log 2>&1 &


