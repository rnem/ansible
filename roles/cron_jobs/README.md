Cron Jobs
=========

Use this role to create cron jobs

Requirements
------------

cron

Role Variables
--------------

```
cronjob_manage: true
managed_cron:
  - name: write to logger1 # Puts a comment heading in cron entry.
    minute: '*'
    hour: '*'
    day: '*'
    month: '*'
    weekday: '*'
    user: root 
    cron_file: mgdate #To use cron_file: parameter you must specify user: as well if blank will put entry in /etc/crontab. Otherwise will use /etc/cron.d/
    job: "echo `date` | /bin/logger" #The command to execute
    state: present
```

#Example of every 5 minute
```
  - name: write to logger2
    minute: '5'
    user: root
    cron_file: mgdate
    job: "echo `date` | logger"
    state: present
```

Creates cron entry.
```
/etc/cron.d/mgdate
#Ansible: write to logger1
* * * * * root echo `date` | /bin/logger
#Ansible: write to logger2
5 * * * * root echo `date` | logger
```

If you remove an ansible cron entry, set state to "absent" and run playbook.
If you change cron "name:", you must either run playbook with state: absent before name change or manualy remove the orignal name entry in the cron file.

Dependencies
------------


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - cron_jobs

License
-------

Roger Nem. All rights reserved

Author Information
------------------
[Roger Nem](https://www.linkedin.com/in/rogertn)