#!/bin/bash
if [ $(expr $(date +%s) / 86400 % 2) -eq 0]; then
    cd /home/ubuntu/arxiv-sanity-lite
        python3 arxiv_daemon.py --num 2000

        if [ $? -eq 0 ]; then
            echo "New papers detected! Running compute.py"
            python3 compute.py
        else
            echo "No new papers were added, skipping feature computation"
        fi
fi