describe systemd_service('journalbeat') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/journalbeat/journalbeat.yml') do
  its('uid') { should eq 0 }
  its('gid') { should eq 0 }
  its('mode') { should cmp '0600' }
end
