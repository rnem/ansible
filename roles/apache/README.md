Apache Role
=========

This role installs apache and gives control of it to a certain user.

Optionally, it also replaces the default logging directories with symlinks to other directories that the user will have access to.

OS Versions:
- RHEL 6
-- This role functions on RHEL 6.

Requirements
------------

This role uses only core modules.

Role Variables
--------------

There are 4 variables at play in this role:

Name                  | Type           | Default | Purpose
----------------------|----------------|---------|-----------
`apache_user`         | string         |         | name of user to have control of the apache server
`apache_manage`       | string         | false   | management toggle

Here is an example of how to use the apache role

```
apache_manage: true
apache_user: acct_name
```

This would produce an apache install, with /etc/httpd and apachectl owned by acct_name.

Playbook Usage
----------------

Implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - apache


# Requirements

Sudo access on remote host.

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)