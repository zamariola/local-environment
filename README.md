# Zama's Local Environment

## Pre-requirements:

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Fedora Cinnamon 32](https://spins.fedoraproject.org/cinnamon/download/index.html)

## How to install

### From a pure environment (WITHOUT git)

1. Download this repo zipped: https://github.com/zamariola/local-environment/archive/master.zip
2. Unzip it
3. Execute the playbook

```bash
sudo ansible-playbook -e user={your-home-user} -v local.yaml
```

### From an existing environment (WITH git)

```bash
sudo ansible-pull -e user={your-home-user} -U https://github.com/zamariola/local-environment.git
```
## Screenshots

![Home screen](https://raw.githubusercontent.com/zamariola/local-environment/master/doc/local_env.png "Home screen")
