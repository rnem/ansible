Rsyslog Client Role
=========

This role is to set the rsyslog client settings

Requirements
------------

RHEL6
restart of rsyslog

RHEL7
restart of rsyslog and systemd-journald

Role Variables
--------------

The RHEL6 OS default values interval is seconds; burst is count of messages
systemlog_interval: 5
systemlog_burst: 200
rsyslog_workdir: /var/lib/rsyslog #commented oy default, needs to defined for statefile tracking

The defined defaults are in vars file.

RHEL6
rsyslog_journald_client_manage: true
managed_rsyslog_journald_client:
  - systemlog_interval: 5
    systemlog_burst: 2000
    rsyslog_workdir: /var/lib/rsyslog
    rate_limit_interval: 30s
    

The RHEL7 OS default values interval is seconds; burst is count of messages

systemd-journald imjournal settings
RateLImitInterval: 30s
RateLimitBurst: 1000

rsyslog imjournal settings legacy directives
$imjournalRatelimitInterval: 600
$imjournalRatelimitBurst: 20000

RHEL7
rsyslog_journald_client_manage: true
managed_rsyslog_journald_client:
  - rate_limit_interval: 30s
    rate_limit_burst: 1000
    imjournal_rate_limit_interval: 600
    imjournal_rate_limit_burst: 20000

Dependencies
------------

Example Playbook
----------------

- name: Rsyslog Client
  hosts:
    - all
  roles:
    - rsyslog_client

License
-------

Roger Nem. All rights reserved

Author Information
------------------

[Roger Nem](https://www.linkedin.com/in/rogertn)