#!/bin/bash

ONEAPI_VERSION="2025.0"

echo "source /opt/intel/oneapi/${ONEAPI_VERSION}/etc/vtune/vars.sh" | sudo tee /etc/profile.d/oneapi.sh
echo "source /opt/intel/oneapi/${ONEAPI_VERSION}/etc/advisor/vars.sh" | sudo tee -a /etc/profile.d/oneapi.sh
