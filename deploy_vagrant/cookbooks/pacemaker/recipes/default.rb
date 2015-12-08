%w{corosync pacemaker}.each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/default/corosync' do
  source 'corosync.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

template '/etc/corosync/corosync.conf' do
  source 'corosync.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

%w{corosync pacemaker}.each do |pkg|
  service pkg do
    action :start
  end
end
