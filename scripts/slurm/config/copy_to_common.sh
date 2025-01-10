#!/bin/bash

sudo mkdir -p /nfs/common/tmp
sudo cp /etc/slurm/gres.conf /nfs/common/tmp/gres.conf
sudo cp /etc/slurm/slurm.conf /nfs/common/tmp/slurm.conf