require 'spec_helper'
describe 'csmodule' do

  context 'with defaults for all parameters' do
    it { should contain_class('csmodule') }
  end
end
