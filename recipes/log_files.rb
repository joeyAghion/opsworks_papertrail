include_recipe "opsworks_papertrail::rsyslog_service"

template "/etc/rsyslog.d/papertrail_log_files.conf" do
  source "papertrail_log_files.conf.erb"
  variables :log_files => node[:papertrail][:log_files], :destination => node[:papertrail][:destination]
  notifies :restart, resources(:service => "rsyslog")
end
