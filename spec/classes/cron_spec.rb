require 'spec_helper'

# Tests ::puppet::cron proxy of ::puppet
describe 'puppet' do
  let(:facts) {{
    :osfamily        => 'Debian',
    :lsbdistcodename => 'precise',
  }}

  context 'cron should be absent by default' do
    let(:params) {{ }}

    it { should contain_cron('puppet').with_ensure('absent') }
  end

  context 'should configure cron resource with command' do
    let(:params) {{
      :cron_ensure  => 'present',
      :cron_command => '/opt/puppet/tools/puppet-apply',
    }}

    it { should contain_cron('puppet').with({
      :ensure  => 'present',
      :command => '/opt/puppet/tools/puppet-apply',
    })}
  end
end
