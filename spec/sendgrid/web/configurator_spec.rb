require 'spec_helper'

describe Sendgrid::Web::Configurator do
  describe 'can store username and password' do
    subject do
      Sendgrid::Web::Configurator.new do |config|
        config.username = 'foo'
        config.password = 'bar'
      end
    end

    its(:username) { should eql('foo') }
    its(:password) { should eql('bar') }
  end
end
