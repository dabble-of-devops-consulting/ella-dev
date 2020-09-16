#!/usr/bin/env bash

cd ..
rsync -avz \
    -e "ssh -i genome-portal/.ssh/nrl-genomics-lims-keypair.pem" \
    genome-portal \
    ec2-user@ec2-100-25-2-88.compute-1.amazonaws.com:/home/ec2-user/efs/