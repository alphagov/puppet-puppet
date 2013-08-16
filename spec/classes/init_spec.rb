require 'spec_helper'

describe 'puppet' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "puppet class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily        => osfamily,
          :lsbdistcodename => 'precise',
        }}

        it { should include_class('puppetlabs_apt') }

        it { should contain_anchor('puppet::begin') }
        it { should contain_class('puppet::package') }
        it { should contain_anchor('puppet::end') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'puppet class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
