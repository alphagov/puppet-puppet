require 'spec_helper'

describe 'puppet' do
  let(:facts) {{
    :osfamily => 'Debian',
    :lsbdistcodename => 'precise',
  }}

  context 'should configure cron resource with command' do
    let(:params){{ :cron_command => '/opt/puppet/tools/puppet-apply',
                   :cron_ensure => 'present' }}

    it { should contain_cron('puppet').with({ :ensure => 'present',
                                              :command => '/opt/puppet/tools/puppet-apply'})}
  end

  context 'cron should be absent by default' do
    let(:params){{ }}

    it { should contain_cron('puppet').with_ensure('absent') }
  end
end
