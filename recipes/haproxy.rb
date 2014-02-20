include_recipe "opsworks_papertrail::rsyslog_service"

template "/etc/rsyslog.conf" do
  source "rsyslog_haproxy.conf.erb"
  mode 0644

  notifies :restart, resources(:service => "rsyslog")
end

template "/etc/rsyslog.d/papertrail_haproxy.conf" do
  source "papertrail_haproxy.conf.erb"
  mode 0644
  variables :destination => node[:papertrail][:destination]

  notifies :restart, resources(:service => "rsyslog")
end
