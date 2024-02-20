Netbackup Client Role
=====================

This role updates / installs the Netbackup client.

Requirements
------------

It is highly recommended to strip-down the provided archives and only keep the RedHat binaries
in order to make the transfer of the installer files faster and save space on the destination
hosts. The role will still work nonetheless as long as the archive location is configured
properly in the defaults file.

Role Variables
--------------

Comments in the defaults file should provide enough insight as to what does what.

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: all
      roles:
         - netbackup_client

License
-------

GNU GPL 2.0

Author Information
------------------

[Roger Nem](https://www.linkedin.com/in/rogertn)
