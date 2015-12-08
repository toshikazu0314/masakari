template '/home/stack/devstack/local.conf' do
  source 'local.conf.erb'
  mode '0644'
  owner 'stack'
  group 'stack'
end

%w{nfs-common}.each do |pkg|
  package pkg do
    action :install
  end
end

directory '/mnt/instances' do
  owner 'stack'
  group 'stack'
  mode '0755'
  action :create
end

#device 'servername:/export/instances'
mount '/mnt/instances' do
  device "#{node['compute_conf']['service_host']}:/export/instances"
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end
