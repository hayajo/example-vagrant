include_recipe 'iptables'

packages = [ 'mysql-server' ]
packages.each do |p|
  package p
end

service 'mysqld' do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

iptables_rule 'ssh'
iptables_rule 'mysql'

# vi: set ft=ruby sw=2 sts=2 :
