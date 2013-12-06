maintainer       "Artsy"
maintainer_email "it@artsymail.com"
license          "MIT"
description      "Configures rsyslog to report application logs to papertrail."

recipe 'opsworks_papertrail::log_files', 'Configure rsyslog to report application logs to papertrail.'
recipe 'opsworks_papertrail::haproxy', "Configure rsyslog to report haproxy notice-level logs to papertrail."
