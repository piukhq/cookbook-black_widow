apt_update

apt_repository 'elasticsearch' do
  arch 'amd64'
  uri 'https://artifacts.elastic.co/packages/7.x/apt'
  components ['main']
  distribution 'stable'
  key 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  deb_src false
end

package 'journalbeat' do
  action :install
end

service 'journalbeat' do
  action :enable
end

template '/etc/journalbeat/journalbeat.yml' do
  source 'journalbeat.yml.erb'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[journalbeat]'
  variables(
    connection_string: node['azure_eventhub_logging']['oslogs_connection_string'],
    endpoint: node['azure_eventhub_logging']['oslogs_endpoint']
  )
end
