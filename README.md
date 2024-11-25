# Cluster environment

Manage the cluster environment with [Ansible](https://www.ansible.com/).

## Prerequisites

### Master machine

#### Install Ansible with pipx

```bash
# Install pipx
sudo apt install pipx
pipx ensurepath

# Reload ${PATH}
source .bashrc

# Install Ansible
pipx install --index-url "https://mirrors.ustc.edu.cn/pypi/simple" --include-deps ansible
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

## Usage

**!!! WARNING !!!**

**The following command will alter the target machines. Add `--check` to perform a dry-run to confirm what will be changed.**

```bash
ansible-playbook -i hosts.ini playbook.yml -K --tags "clone-repo, <tag>, ..."
```

## Tags

| Required | Application | Tag |
| --- | --- | --- |
| Yes | Clone this repository | `clone-repo` |
| No | [Intel oneAPI HPC Toolkit](https://www.intel.com/content/www/us/en/developer/tools/oneapi/hpc-toolkit.html) | `intel-oneapi-hpc-toolkit` |
