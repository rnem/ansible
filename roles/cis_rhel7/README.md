CIS for Red Hat Entreprise Linux 7
==================================

This role can be used to audit or remediate a host against the Center for
Internet Security (CIS) security benchmarks.

Currently, this role supports:
 - Red Hat Enterprise Linux 6 Benchmark 2.1.1

Role Variables
--------------

Some sensible defaults are configured and documented within defaults/main.yml.
These defaults are set so they would cause minimal disruption to a production
system. However, it's *your* responsibility to verify that the default
configuration will not harm your production server. *Always* run the role in
check mode if you're unsure of its effects.

Be aware that some of the default variables are set against CIS recommendations
in the hopes that they will cause minimal disruption to a system.

Example Playbook
----------------

Playbooks can utilize the CIS role without much effort:

    - hosts: all
      roles:
        - cis_rhel7

The role is thoroughly tagged so that you can run certain sections or certain
levels of checks:

    # Test only items from section 4
    ansible-playbook -i hosts -C cis.yml -t section4

    # Apply changes only from items in section 4, 5, and 6
    ansible-playbook -i hosts cis.yml -t section4,section5,section6

    # Apply changes only from item 1.1.1.4
    ansible-playbook -i hosts cis.yml -t section1.1.1.1

License
-------

Apache License, Version 2.0

Author Information
------------------

Major Hayden <major@mhtx.net> (Initial implementation)
[Roger Nem](https://www.linkedin.com/in/rogertn) (Updates to 2.1.1)
