Storage Role
=========

This role manages system storage

OS Versions:
- RHEL 6
- RHEL 7
-- This role functions on RHEL6 and RHEL7

Requirements
------------

This role uses only core modules.

Role Variables
--------------

There are 2 variables at play in this role:

Name               | Type           | Default | Purpose
-------------------|----------------|---------|-----------
`managed_storage`  | list of dicts  |         | list of mounts to manage
`storage_manage`   | string         | false   | management toggle

`managed_storage` has the following sub-variables:

Name            | Type   | Default Variable                        | Default Value       | Purpose
----------------|--------|-----------------------------------------|---------------------|--------------
`lvg_state`     | string | lvg_state                               | `present`           | status of VG (GLOBAL)
`storage_force` | string |                                         | `no`                | force status (protects the state)
`vg`            | string | vg_name                                 | `vgAPPS`            | name of VG
`pvs`           | string | pvs                                     | `/dev/sdb`          | comma delimited list of devices for VG
`pesize`        | string |                                         |                     | size of VG
`vg_options`    | string |                                         |                     | options for `vgcreate`
`lvol_state`    | string | lvol_state                              | `present`           | status of LV (GLOBAL)
`lv`            | string |                                         |                     | name of LV (REQUIRED)
`size`          | string |                                         |                     | size of LV in MB (REQUIRED for local)
`fstype`        | string |                                         |                     | type of filesystem (REQUIRED)
`dev`           | string | vg_name, lv                             | `/dev/vg_name/lv`   | path to LV
`fs_opts`       | string |                                         |                     | options for `mkfs`
`fstab`         | string |                                         | `/etc/fstab`        | path to fstab
`mount_state`   | string | mount_state                             | `mounted`           | status of mountpoint (GLOBAL)
`name`          | string | path                                    |                     | path of mountpoint
`src`           | string | vg_name, lv if local                    | `/dev/vg_name/lv`   | path to LV or NFS (REQUIRED if NFS)
`opts`          | string | opts_local or opts_nfs                  | See Defaults        | `mount` options
`dump`          | string | dump_local or dump_nfs                  | `1` or `0`          | fstab options
`passno`        | string | passno_local or passno_nfs              | `2` or `0`          | fstab options
`dir_state`     | string | dir_state                               | `directory`         | status of directory (GLOBAL)
`follow`        | string |                                         |                     | follow symlinks?
`owner`         | string |                                         |                     | mountpoint owner
`group`         | string | owner                                   |                     | mountpoint group
`path`          | string |                                         |                     | path to mountpoint (REQUIRED)
`mode`          | string | mode                                    | `0700`              | mountpoint permmissions
`recurse`       | string |                                         |                     | define permissions recursively?
`selevel`       | string | mount_selevel                           | `s0`                | management toggle
`serole`        | string | mount_serole                            | `object_r`          | management toggle
`setype`        | string | mount_setype_local or mount_setype_nfs  | `file_t` or `nfs_t` | management toggle
`seuser`        | string | mount_seuser                            | `system_u`          | management toggle

Note that some of these sub-variables are GLOBAL, in that they apply to all listed mounts, whereas most are specific
to the particular mount in question. Also note that some variables are REQUIRED, meaning that they must be present.
Also note that some variables have values that differ depending on whether storage is local or nfs.

Here is an example of how to use the storage role

```
storage_manage: true
managed_storage:
  - pvs: "/dev/sdb"
    lv: "lvca"
    size: "1024"
    fstype: "ext4"
    owner: "user1"
    mode: "770"
    path: "/opt/CA"
  - pvs: "/dev/sdc,/dev/sdd"
    vg: "vgAPPS2"
    lv: "lvappteam"
    size: "60412"
    fstype: "xfs"
    owner: "appteamuser"
    path: "/opt/appteam"
    recurse: yes
  - path: "/opt/mftprd"
    src: "isilonhost1:/ifs/appteam-folder"
    fstype: "nfs"
    owner: "appteamuser"
```

This would produce 3 mounts, /opt/CA, /opt/appteam, /opt/mftprd. 

- /opt/CA is backed by VG vgAPPS on /dev/sdb and is formatted ext4 with size 1024MB and permissions of 0770 with owner `user1`.
- /opt/appteam is backed by VG vgAPPS2 on /dev/sdc and /dev/sdd and is formatted xfs with size 60412MB and permissions of 0700 
with owner `appteamuser` applied recursively.
- /opt/mftprd is backed by nfs mount isilonhost1:/ifs/appteam-folder with owner `appteamuser`

Playbook Usage
----------------

Implement it in your playbook as below:

    - hosts: some hosts
      roles:
        - storage

# Requirements

Sudo access on remote host.

# License

Roger Nem. All rights reserved

# Author Information

[Roger Nem](https://www.linkedin.com/in/rogertn)