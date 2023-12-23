# Zama's Local Environment

## Pre-requirements

- [Fedora 39](https://getfedora.org)

## How to install


### From an existing environment (WITH git)

```bash
sudo ansible-pull -e user=$(whoami) -U https://github.com/zamariola/local-environment.git -v --tags "shell"
```
## Screenshots

![Home screen](https://raw.githubusercontent.com/zamariola/local-environment/master/doc/local_env.png "Home screen")
