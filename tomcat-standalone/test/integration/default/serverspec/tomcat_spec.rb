require 'spec_helper'

describe package('java-1.7.0-openjdk') do
  it { should be_installed }
end

describe group('tomcat') do
  it { should exist }
end

describe user('tomcat') do
  it { should exist }
end

describe file('/opt/apache-tomcat-7.0.50.tar.gz') do
  it { should be_file }
end

describe file('/usr/share/tomcat') do
  it { should be_file }
  it { should be_linked_to '/opt/apache-tomcat-7.0.50' }
  it { should be_owned_by 'tomcat' }
  it { should be_grouped_into 'tomcat' }
end

describe file('/usr/share/tomcat/conf/server.xml') do
  it { should be_file }
  its(:content) { should match /<Connector port="8080"/ }
  its(:content) { should match /<Connector port="8443"/ }
end

describe file('/usr/share/tomcat/conf/tomcat-users.xml') do
  it { should be_file }
  its(:content) { should match /<user username="admin"/ }
  its(:content) { should match /password="adminsecret"/ }
end

describe file('/etc/init.d/tomcat') do
  it { should be_mode 0755 }
  it { should be_executable }
end

describe file('/etc/sysconfig/iptables/iptables-save') do
  it { should be_file }
end

describe port(8080) do
  it { should be_listening }
end