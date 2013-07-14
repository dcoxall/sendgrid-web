require 'spec_helper'

describe Sendgrid::Web::ParseWebhookSettings do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/parse.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '{
          "parse": [
            {
              "hostname": "www.example.com",
              "url": "www.mydomain.com/parse.php",
              "spam_check": 1
            }
          ]
        }'
      end
    end
  end

  describe '#set' do
    it_behaves_like('a sendgrid response', '/api/parse.set.json') do
      let(:action) { subject.set(
        hostname: 'www.example.com',
        url: 'www.mydomain.com/parse.php') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#edit' do
    it_behaves_like('a sendgrid response', '/api/parse.edit.json') do
      let(:action) { subject.edit(
        hostname: 'www.example.com',
        url: 'www.mydomain.com/parse.php') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/parse.delete.json') do
      let(:action) { subject.delete(hostname: 'www.example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
