require 'spec_helper'

describe Sendgrid::Web::SpamReports do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/spamreports.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "ip": "174.36.80.219",
            "email": "example@aol.com",
            "created": "2009-12-06 15:45:08"
          }
        ]'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/spamreports.delete.json') do
      let(:action) { subject.delete(email: 'foobar@example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
