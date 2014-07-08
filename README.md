ansible-exec
============
An ansible-playbook wrapper, meant to be used as the interpreter for ansible playbooks.

## Basic Usage
* Put `ansible-exec.sh` where ever you want, say /usr/local/bin or in your playbooks repository.
* Put the path to ansible-exec.sh in a shebang line for a playbook you wish to exec: `#!/usr/local/bin/ansible-exec.sh`
* Add execute permissions to the playbook: `chmod u+x playbook.yml`
* Run it! `./playbook.yml`

**Note:** the working directory will be changed to the dir containing the yaml file before running `ansible-playbook`

## Parameters
`ansible-exec` currently handlers three kinds of parameters passed to the playbook when executing:
* `-i INVENTORY`: Set the inventory file to use. If not passed, a dummy inventory will be used (useful for localhost playbooks).
* `--variable VALUE`: Set the variable name to VALUE. Will be passed to `ansible-playbook` as: `-e variable="VALUE"`
* Raw ansible-playbooks parameters: Just put them after a `--` parameter: `./playbook.yml -i inventory -- --skip-tags someapp`

