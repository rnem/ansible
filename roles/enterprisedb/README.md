EnterpriseDB (EDB) Role
=========

This role installs and configures Enterprise DB.

OS Versions:
- RHEL 7
-- This role functions on RHEL 7.

Requirements
------------

Role Variables
--------------

Playbook Usage
----------------

Since the existing elasticsearch playbook simply calls this role on a set of hosts, you can either change the configuration for that set of hosts or implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - enterprisedb

# Requirements

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)
