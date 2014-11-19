# Cookbook Name:: Thoughtworks GO
# Recipe:: default
#
# Copyright 2014, Tumba
#
# All rights reserved - Do Not Redistribute


remote_file "/tmp//go-server-14.3.0-1186.deb" do
  source "http://download.go.cd/gocd-deb/go-server-14.3.0-1186.deb"
  owner "root"
  group "root"
  mode "0755"   
  action :create 
end

package "/go-server-14.3.0-1186.deb" do
  source "/tmp/go-server-14.3.0-1186.deb"
  action :install
end

template "/etc/go/cruise-config.xml" do
  source "cruise-config.xml.erb"
  owner "go"
  group "go"
  mode "0644"
end

service "go-server" do 
        action [:enable, :start]
end











































