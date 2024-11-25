# Cluster environment

Manage the cluster environment with [Ansible](https://www.ansible.com/).

## Prerequisites

### Master machine

#### Install Ansible with pipx

```bash
# Install pipx
sudo apt install pipx
pipx ensurepath

# Install Ansible
pipx install --include-deps ansible

# Reload ${PATH}
source .bashrc
```

#### Generate SSH key and copy it to the all machines

```bash
# Generate SSH key
ssh-keygen -t ed25519

# Add SSH key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy SSH key to the all machines, don't forget to copy the key to the master machine
ssh-copy-id <username>@<target-machine>
```

### Target machines

Required packages:

- `python-apt`
- `git`

## Usage

**!!! WARNING !!!**

**The following command will alter the target machines. Add `--check` to perform a dry-run to confirm what will be changed.**

```bash
ansible-playbook -i hosts.ini playbook.yml -K --tags "<tag1>, <tag2>, ..."
```

## Tags

| Required | Application | Tag |
| --- | --- | --- |
| Yes | Clone this repository | `clone-repo` |
| No | [Intel oneAPI HPC Toolkit](https://www.intel.com/content/www/us/en/developer/tools/oneapi/hpc-toolkit.html) | `intel-oneapi-hpc-toolkit` |
| No | Telegraf-Influxdb-Grafana stack for monitoring | `tig-stack` |
| No | [Grafana](https://grafana.com/) | `grafana` |
| No | [InfluxDB](https://www.influxdata.com/) | `influxdb` |
| No | [Telegraf](https://www.influxdata.com/) | `telegraf` |
