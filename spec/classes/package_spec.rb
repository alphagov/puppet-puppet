require 'spec_helper'

# Tests ::puppet::package proxy of ::puppet
describe 'puppet' do
  let(:facts) {{
    :osfamily        => 'Debian',
    :lsbdistcodename => 'precise',
  }}

  context 'param defaults' do
    let(:params) {{ }}

    it { should contain_package('puppet').with_ensure('present') }
    it { should contain_package('puppet-common').with_ensure('present') }
    it { should contain_package('facter').with_ensure('present') }
  end

  context 'puppet_ensure' do
    let(:params) {{
      :puppet_ensure => '1.2.3',
    }}

    it { should contain_package('puppet').with_ensure('1.2.3') }
    it { should contain_package('puppet-common').with_ensure('1.2.3') }
  end

  context 'facter_ensure' do
    let(:params) {{
      :facter_ensure => '1.2.3',
    }}

    it { should contain_package('facter').with_ensure('1.2.3') }
  end
end
