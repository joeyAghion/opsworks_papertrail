**This cookbook is no longer actively maintained. I recommend [remote_syslog2](https://github.com/trappar/remote_syslog2-cookbook) instead.**

## opsworks_papertrail

Custom cookbook for configuring OpsWorks instances to send logs to papertrail.


### Recipes

#### opsworks_papertrail::log_files

Recipe `opsworks_papertrail::log_files` will add a `papertrail_log_files.conf` file to `/etc/rsyslog.d/`. It configures file-watching for the log files listed in the `node[:papertrail][:log_files]` hash, sending any new data to the specified `node[:papertrail][:destination]`.

#### opsworks_papertrail::haproxy

Recipe `opsworks_papertrail::haproxy` will add a `papertrail_haproxy.conf` file to `/etc/rsyslog.d/`. It configures reporting of Haproxy's notice-level log messages to the specified `node[:papertrail][:destination]`.


### OpsWorks Set-Up

The custom recipes can be associated with your OpsWorks layer's `Setup` event.

Example of custom stack JSON:

    {
      "papertrail": {
        "destination": "logs.papertrailapp.com:30285",
        "log_files": {
          "rails": "/srv/www/myapp/shared/log/staging.log",
          "unicorn-stdout": "/srv/www/myapp/shared/log/unicorn.stdout.log",
          "unicorn-stderr": "/srv/www/myapp/shared/log/unicorn.stderr.log",
          "nginx-access": "/var/log/nginx/staging.myapp.com.access.log",
          "nginx-error": "/var/log/nginx/staging.myapp.com.error.log"
        }
      }
    }


### Caveats

If you use the `opsworks_papertrail::log_files` recipe to monitor rails/unicorn logs, you may find that papertrail stops receiving those messages after logs are rotated. This is due to conflicts between rsyslog's offset-based file-monitoring and logrotate's `copytruncate` command. To fix, supply a custom recipe that overrides the default opsworks logrotate template (removing `copytruncate` and forcing unicorn to reopen logs upon rotation), as documented in [#1](https://github.com/joeyAghion/opsworks_papertrail/issues/1).


&copy; [Joey Aghion](http://joey.aghion.com), [Artsy](http://artsy.net). See [LICENSE](LICENSE) for details.
