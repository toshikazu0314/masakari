## use local repository
#template "/etc/apt/sources.list" do
#  source 'sources.list.erb'
#  mode '0644'
#  owner 'root'
#  group 'root'
#end

execute "apt-get" do
  command 'apt-get update'
end

%w{language-pack-en language-pack-ja}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "update-locale-ctype" do
  command 'sudo update-locale LC_CTYPE=en_US.UTF-8'
end

execute "update-locale-all" do
  command 'sudo update-locale LC_ALL=en_US.UTF-8'
end
