ansible-exec
============
An ansible-playbook wrapper, meant to be used as the interpreter for ansible playbooks.

## Basic Usage
* Run `make install` to put ansible-exec in `/usr/local/bin` and config in `/etc/ansible`
* Put the path to ansible-exec.sh in a shebang line for a playbook you wish to exec: `#!/usr/local/bin/ansible-exec`
* Add execute permissions to the playbook: `chmod u+x playbook.yml`
* Run it! `./playbook.yml`

**Note:** the working directory will be changed to the dir containing the yaml file before running `ansible-playbook`

## Parameters
`ansible-exec` currently handlers three kinds of parameters passed to the playbook when executing:
* `-i INVENTORY`: Set the inventory file to use. If not passed, a dummy inventory will be used (useful for localhost playbooks).
* `--variable VALUE`: Set variable to VALUE. Will be passed to `ansible-playbook` as: `-e variable="VALUE"`
* Raw ansible-playbooks parameters: Just put them after a `--` parameter: `./playbook.yml -i inventory -- --skip-tags someapp`

## Config file
You can place  a config file at `~/.ansible_exec.conf` or `/etc/ansible/ansible_exec.conf`. Currently available options:
* ANSIBLE_PLAYBOOK_ARGS: Parameters that will always be passed to `ansible-playbook`. Useful for vault passoword files.
* DEFAULT_INVENTORY: Override the default dummy inventory behavior when `-i` isn't passed.
