yum versionlock role
====================

This role makes sure that yum-versionlock is installed, and configures locked packages.

OS Versions:
- RHEL 6
-- This role functions on RHEL 6.
- RHEL 7
-- This role functions on RHEL 7.

Requirements
------------

This role uses only core modules.

Role Variables
--------------

This role currently has three variables:

Name                               | Type               | Purpose
---------------------------------- | ------------------ | --------
`yum_versionlock_locks`            | list of hashes     | Define which users are allowed to run crontab
`yum_versionlock_manage`           | boolean            | Define whether any tasks are executed
`yum_versionlock_follow_obsoletes` | string of '0' or 1 | Defines whether version locking follows "obsoletes" items

Each hash in `yum_versionlock_locks` has 5 keys:

```
yum_versionlock_locks:
- package: packagename
  version: package version
  release: package release
  epoch: package epoch (default '0')
  arch: package architecture (default '*')
```

Playbook Usage
----------------

Since the existing yum_versionlock playbook simply calls this role on a set of hosts, you can either change the configuration for that set of hosts or implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - yum_versionlock

# Requirements

To execute this role you need access to a valid ansible ssh key.

# License

Roger Nem. All rights reserved.

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)