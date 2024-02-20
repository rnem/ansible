Splunk Universal Forwader
=========================

This role uploads and installs the Splunk Universal Forwarder.

Variables
=========

Name                       | Purpose
-------------------------- | --------------- 
splunkuf_manage            | toggles the role (defaults to false)
splunkuf_ver               | the package version to upload and install
splunkuf_dir               | the directory where the forwarder will be installed (defaults to /opt/splunkforwarder with the rpm)
splunkuf_user              | the user that will run splunk (defaults to splunk)
splunkuf_group             | the group of said user (defaults to splunk)
splunkuf_read_dir          | the folder we are reading logs from (defaults to /var/log)
splunkuf_deployment_server | the server we are forwarding the logs to
splunkuf_deployment_port   | the port on this server
splunkuf_destroy_local_db  | do we want to completely remove the splunk folder before installing (defaults to false)

There is a list of basic packages required. These should already be installed by default and the list is here for safety only.

splunkuf_required:
  - acl
  - coreutils

Author Information
------------------

[Roger Nem](https://www.linkedin.com/in/rogertn)