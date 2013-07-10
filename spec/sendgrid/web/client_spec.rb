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

  describe '.new' do
    context 'when pre-configured' do
      before do
        Sendgrid::Web::Client.configure do |config|
          config.username = 'foo'
          config.password = 'bar'
        end
      end

      it 'will have access to configuration' do
        subject.config.should be_instance_of(Sendgrid::Web::Configurator)
        subject.config.username.should eql('foo')
        subject.config.password.should eql('bar')
      end
    end

    context 'when not pre-configured' do
      before { subject.send('config=', nil) }

      it 'will have an empty config object' do
        subject.config.should be_instance_of(Sendgrid::Web::Configurator)
        subject.config.username.should be_nil
        subject.config.password.should be_nil
      end
    end
  end
end
