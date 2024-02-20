NFS Server Role
=========

This role enables the NFS server and configures /etc/exports

OS Versions:
- RHEL 6
-- This role functions on RHEL 6.
- RHEL 7
-- This role functions on RHEL 7.

Requirements
------------

This role uses only core modules.

NOTE: You will need to add TCP/2049 to the iptables on the server(s).


Role Variables
--------------

There are 2 top-level variables at play in this role:

Name                 | Type            | Default | Purpose
-------------------- | --------------- | ------- | -----------
`nfs_server_manage`  | boolean         | false   | management toggle
`nfs_exports`        | list of dicts   | []      | list of paths to be exported

`nfs_exports` has two 1st-tier variables...
Name                 | Type            | Default | Purpose
-------------------- | --------------- | ------  | -----------
`path`               | string          | NULL    | path to be exported
`hosts`              | list of dicts   | NULL    | list of hosts with access

`nfs_exports.hosts` has two 2nd-tier variables
Name                 | Type            | Default | Purpose
-------------------- | --------------- | ------  | -----------
`host`               | string          | NULL    | host pattern with access
`opts`               | list of strings | NULL    | list of optional options

`nfs_server_manage` will enable and activate the NFS server software while the
other options will properly configure the exports on the server. It is worth
noting that without these other variables configured the default is the empty
list, which means that the nfs server will have no exports.

The nfs_exports.hosts.host string can use a hostname, FQDN, CIDR IPv4 or IPv4
range or NIS netgroup as per the /etc/exports documentation

If nfs_exports_hosts.opts is not specified for a given item, the NFS defaults
will be used

If nfs_exports_hosts.host is not specified for a given item,
nfs_exports_hosts.opts for that item will be applied to 'all other hosts'

Example
-------

```
nfs_server_manage: true
nfs_exports:
- path: /usr/sap/trans
  hosts:
  - host: 'saphost1'
    opts: ['rw', 'sync']
  - host: 'otherhost'
  - host: 'some.ip.v4.addr/24'
- path: /opt/kerfuffle
  hosts:
  - opts: ['rw']

```

will produce an `/etc/exports` file with contents of

```
/usr/sap/trans saphost1(rw,sync) otherhost some.ip.v4.addr/24
/opt/kerfuffle (rw)
```

Playbook Usage
----------------

Since the existing nfs_server playbook simply calls this role on a set of
hosts, you can either change the configuration for that set of hosts or
implement it in your playbook as below:

```
- hosts: some hosts
  roles:
  - nfs_server
```

# Requirements

Sudo access on remote host.

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)
