template '/home/stack/devstack/local.conf' do
  source 'local.conf.erb'
  mode '0644'
  owner 'stack'
  group 'stack'
end

%w{nfs-kernel-server}.each do |pkg|
  package pkg do
    action :install
  end
end

directory '/export' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/export/instances' do
  owner 'stack'
  group 'stack'
  mode '0755'
  action :create
end

template '/etc/exports' do
  source 'exports.erb'
  mode '0644'
  owner 'stack'
  group 'stack'
end

service 'nfs-kernel-server' do
  action :start
end
