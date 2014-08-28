require 'spec_helper'

describe file('/etc/yum.repos.d/epel.repo') do
  it { should be_file }
end

describe package('ibselinux-python') do
  it { should be_installed }
end
