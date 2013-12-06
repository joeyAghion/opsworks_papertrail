include_recipe "opsworks_papertrail::rsyslog_service"

template "/etc/rsyslog.conf" do
  source "rsyslog_haproxy.conf.erb"
  notifies :restart, resources(:service => "rsyslog")
  mode 0644
end

template "/etc/rsyslog.d/papertrail_haproxy.conf" do
  source "papertrail_haproxy.conf.erb"
  variables :destination => node[:papertrail][:destination]
  notifies :restart, resources(:service => "rsyslog")
  mode 0644
end
