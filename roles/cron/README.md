Cron Role
=========

This role makes sure that cron is installed, and properly configures allowed users.

OS Versions:
- RHEL 5
-- This role could function on RHEL 5 in theory, but has not yet been tested.
- RHEL 6
-- This role functions on RHEL 6.
- RHEL 7
-- This role could function on RHEL 7 in theory, but ansible can configure RHEL 7 directly without the need of this role.

Requirements
------------

This role uses only core modules.

Role Variables
--------------

This role currently uses only two variables:

Name                     | Type            | Purpose
------------------------ | --------------- | --------
`cron_allowed_users`     | list            | Define which users are allowed to run crontab
`cron_manage`            | boolean         | Define whether any tasks are executed

Playbook Usage
----------------

Since the existing cron playbook simply calls this role on a set of hosts, you can either change the configuration for that set of hosts or implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - cron

# Requirements

To execute this role you need access to a valid ansible ssh key.

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)