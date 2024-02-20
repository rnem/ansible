Sudo Limits Role
============

This role manages local/limited versions of sudoers files for one-off sudoers.

It manages a file called /etc/sudoers.d/limited

OS Versions:
 - Linux
 - Solaris

Requirements
------------

This role uses only core modules.

Role Variables
--------------

There are 2 variables at play in this role:

Name                 | Type           | Default | Purpose
---------------------|----------------|---------|-----------
`managed_sudoers`    | list of dicts  |         | list of limited sudoers files
`sudo_limited_manage`| string         | false   | management toggle

managed_ulimits has the following sub-variables:

Name          | Type           | Purpose
--------------|----------------|-------------------
`sudoers`     | list of dict   | list of lines for the file

sudoers has the following sub-variables:

Name        | Type           | Default | Purpose
------------|----------------|------------------------
`ticket`    | string         | none    | Optional: What servicenow ticket authorized this
`expires`   | string         | none    | Optional: When does this request expire
`user`      | string         | none    | What user are we granting privs
`hosts`     | string         | ALL     | On what hosts do they get these privs
`asuser`    | string         | ALL     | What user can they run commands as
`command`   | string         | none    | What commands can they run as that user

Here is an example of how to use the sudoers role

```
sudo_limited_manage: true
managed_sudoers:
  -  sudoers:
     - { user: "testuser", commands: "/bin/false", expires: "2016-07-01", ticket: "REQ11223344" }
     - { user: "testuser2", hosts: "foo", asuser: "bar", commands: "/bin/false", expires: "2016-07-01", ticket: "REQ11223344" }
```

This would produce a file with two entries:

```
# testuser
# Created: 2016-05-12
# Expires: 2016-07-01
#  Ticket: REQ11223344
testuser ALL=(ALL) /bin/false

# testuser2
# Created: 2016-05-12
# Expires: 2016-07-01
#  Ticket: REQ11223344
testuser2 foo=(bar) /bin/false
```

Playbook Usage
----------------

Implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - sudo_limited

# Requirements

Sudo access on remote host.

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)
