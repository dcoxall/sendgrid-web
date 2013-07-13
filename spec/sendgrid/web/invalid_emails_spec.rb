require 'spec_helper'

describe Sendgrid::Web::InvalidEmails do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/invalidemails.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "reason": "Known bad domain",
            "created": "2011-06-06 16:11:57",
            "email": "test@example.com"
          }
        ]'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/invalidemails.delete.json') do
      let(:action) { subject.delete(email: 'foobar@example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
