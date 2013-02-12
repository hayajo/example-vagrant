include_recipe 'perlbrew'
include_recipe 'iptables'

packages = [ 'httpd', 'httpd-devel', 'php', 'php-pdo' ]
packages.each do |p|
  package p
end

perlbrew_perl 'perl-5.16.2' do
  action :install
end

perlbrew_cpanm 'Carton' do
  perlbrew 'perl-5.16.2'
  modules ['Carton']
end

service 'httpd' do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

iptables_rule 'ssh'
iptables_rule 'http'
iptables_rule 'https'

# vi: set ft=ruby sw=2 sts=2 :
