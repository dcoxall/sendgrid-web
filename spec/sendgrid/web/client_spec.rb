require 'spec_helper'

describe Sendgrid::Web::Client do
  describe '.configure' do
    subject { Sendgrid::Web::Client.config }

    before do
      Sendgrid::Web::Client.configure do |config|
        config.username = 'foo'
        config.password = 'bar'
      end
    end

    it 'creates an instance of Sendgrid::Web::Configurator' do
      subject.should be_instance_of(Sendgrid::Web::Configurator)
    end

    it 'passes the block to the configurator object' do
      subject.username.should eql('foo')
      subject.password.should eql('bar')
    end
  end
end
