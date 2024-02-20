Subscribe Satellite Role
=========

Requirements
------------
- A working RedHat Satellite Server
- RedHat Linux OS installed
- /usr/sbin/subscription-manager

Role Variables
--------------
./default/ variables:
Variables here are meant to be overriden in host_vars, group_vars 
or elsewhere if desired. 

Variables in ../vars/main.yml are variables for internal role playbook
use only and should never be overriden.
Most of these variables should probably go into group_vars/all/some_file.yml.

Example -- If you want a server to have standard rhel6 and scl6 repos, set in host_vars
or group_vars something like this and the below dictionary and include playbooks will t
take care of the rest:
  satellite_activation_keys: 
    - ak-rhel6
    - ak-scl6


../vars/main.yml has variable "subscription_manager_repos_enable_list"
is fancy Jinja2 that will make flat list of all the repos from the list 
of corresponding activation-keys defined in satellite_activation_keys.
This is all done to ensure only the defined yum repos defined in code 
will get enabled.

./var/<any file> variables:

"satellite_activation_key_repos" is a dictionary/hash that keeps a list of 
Satellite activation-keys and the product yum repositories accosiated with them.

ansible_fqdn was used for subscription-manager register --name flag because 
the RedHat Satellite Server will properly associate reports
and kickstart/provisioning settings correctly. 
ansible_fqdn was also picked because it will rely on what is in DNS and not what is configured
or misconfigured on the target host.

Dependencies
------------

Same as requirements

Example Playbook
----------------

```
  - name: Subscribe Satellite Role All Systems
    hosts: all
    roles:
      - subscribe_satellite
```

License
-------

Roger Nem. All rights reserved.


Author Information
------------------

[Roger Nem](https://www.linkedin.com/in/rogertn)