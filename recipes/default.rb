#
# Cookbook Name:: cc_haproxy
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "haproxy"

#cookbook_file "/etc/haproxy/haproxy.cfg" do
#  source "haproxy.cfg"
#  owner "root"
#  group "root"
#  mode 00644
#  notifies :restart, "service[haproxy]"
#end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, "service[haproxy]"
end

service "haproxy" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end
