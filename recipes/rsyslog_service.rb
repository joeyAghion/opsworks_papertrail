service "rsyslog" do
  supports :restart => true
  restart_command "/etc/init.d/rsyslog restart"
  action :nothing
end
