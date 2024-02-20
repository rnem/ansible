Ulimits Role
=========

This role manages files in /etc/security/limits.d/

OS Versions:
- RHEL 6 -- This role functions on RHEL 6.
- RHEL 7 -- This role functions on RHEL 7.

Requirements
------------

This role uses only core modules.

Role Variables
--------------

There are 2 variables at play in this role:

Name               | Type           | Default | Purpose
-------------------|----------------|---------|-----------
`managed_ulimits`  | list of dicts  |         | list of limit domains to manage
`ulimits_manage`   | string         | false   | management toggle

`managed_ulimits` has the following sub-variables:

Name        | Type           | Purpose
------------|----------------|-------------------
`domain`    | string         | domain of limit
`priority`  | string         | limit file priority
`limits`    | list of dict   | list of actual limits for the domain

`limits` has the following sub-variables:

Name        | Type           | Purpose
------------|----------------|-------------------
`type`      | string         | type of limit
`limit_item`| string         | item to limit
`value`     | string         | limit value

Here is an example of how to use the ulimits role

```
ulimits_manage: true
managed_ulimits:
  - domain: appteam
    priority: 91
    limits:
      - { type: "soft", limit_item: "nofile", value: "8192" }
```

This would produce a file called `91-appteam.conf` with a single limit `appteam soft nofile 8192`

Playbook Usage
----------------

Implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - ulimits


# Requirements

Sudo access on remote host.

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)