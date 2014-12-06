require 'spec_helper'

describe Halite::Converter::Metadata do
  describe '#generate' do
    let(:gem_name) { 'mygem' }
    let(:version) { '1.0.0' }
    let(:license_header) { '' }
    let(:spec) { double(name: gem_name, version: version, license_header: license_header) }
    subject { described_class.generate(spec) }

    context 'with simple data' do
      it { is_expected.to eq <<-EOH }
name "mygem"
version "1.0.0"
EOH
    end # /context with simple data

    context 'with a license header' do
      let(:license_header) { "# header\n" }
      it { is_expected.to eq <<-EOH }
# header
name "mygem"
version "1.0.0"
EOH
    end # /context with a license header
  end # /describe #generate
end
