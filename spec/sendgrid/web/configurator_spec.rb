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

  it 'sets a default root_url for sendgrid' do
    subject.root_url.should eql('https://sendgrid.com')
  end

  it 'can overwrite the api root_url' do
    configurator = Sendgrid::Web::Configurator.new do |config|
      config.root_url = 'https://example.com'
    end
    configurator.root_url.should eql('https://example.com')
  end
end
