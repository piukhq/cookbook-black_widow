apt_update

apt_repository 'elasticsearch' do
  arch 'amd64'
  uri 'https://artifacts.elastic.co/packages/7.x/apt'
  components ['main']
  distribution 'stable'
  key 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  deb_src false
  action :remove
end

apt_repository 'elasticsearch-oss' do
  arch 'amd64'
  uri 'https://artifacts.elastic.co/packages/oss-7.x/apt'
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

if node.role?('elasticsearch')
  hostname = 'localhost:9200'
  bad_ssl = true
else
  hostname = 'elasticsearch.uksouth.bink.host:9200'
  bad_ssl = false
end

template '/etc/journalbeat/journalbeat.yml' do
  source 'journalbeat.yml.erb'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  notifies :restart, 'service[journalbeat]'
  variables(
    hostname: hostname,
    bad_ssl: bad_ssl
  )
end
