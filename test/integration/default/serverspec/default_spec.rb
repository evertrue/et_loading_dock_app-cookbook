require 'spec_helper'

describe user('deploy') do
  it { is_expected.to exist }
end

describe file('/etc/nginx/sites-enabled/socketproxy.conf') do
  it { is_expected.to be_linked_to '/etc/nginx/sites-available/socketproxy.conf' }
end

describe file('/etc/nginx/sites-available/socketproxy.conf') do
  describe '#content' do
    subject { super().content }
    it { is_expected.to match(%r{root .*/loading-dock/.*}) }
  end
end

describe service('nginx') do
  it { is_expected.to be_enabled }
end

describe process('nginx') do
  describe '#args' do
    subject { super().args }
    it { is_expected.to match(%r{master process /usr/sbin/nginx}) }
  end
end

describe port(8080) do
  it { is_expected.to be_listening.with('tcp') }
end
