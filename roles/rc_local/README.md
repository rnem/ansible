rc_local Role
=========

This role edits the rc.local file

OS Versions:
- RHEL 6
- RHEL 7
-- This role functions on RHEL6 and RHEL7

Requirements
------------

This role uses only core modules.

Role Variables
--------------

The rc_local role edits the rc.local file based on two variables:

Name                     |Type             |Purpose
-------------------------|-----------------|---------
`rc_local_entries`       |list of dicts    |Define the per-group section of the OUTPUT chain
`rc_local_manage`        |boolean          |Define whether any tasks are executed

The allowed key/value pairs in the rc_local_entries dictionary are allowed.

Name          |Type    |Contents
------------- |--------|---------
`replace_term`|string  |String to search for to find line to replace (should be a substring of command)
`user`        |string  |User to run command as
`command`     |string  |Command to be run as user
`precmd`      |string  |Command run as root directly before `command`

Thus an entry like

```
rc_local_manage: true
rc_local_entries:
- replace_term: "HPALM"
  user: "ABC_admin"
  command: "/opt/qc/HP/ALM/wrapper/HPALM start"
  precmd: "ulimit -S -H -n 65536"
```

would result in the following entry in rc.local

```
ulimit -S -H -n 65536; /bin/su -l 'ABC_admin' --command "/opt/qc/HP/ALM/wrapper/HPALM start"
```

Playbook Usage
----------------

Since the existing rc_local playbook simply calls this role on a set of hosts, you can either change the configuration for that set of hosts or implement it in your playbook as below:
```
    - hosts: some hosts
      roles:
        - rc_local
```

# Requirements

None

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)