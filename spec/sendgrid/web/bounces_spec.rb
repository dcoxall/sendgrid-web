require 'spec_helper'

describe Sendgrid::Web::Bounces do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/bounces.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "status": "4.0.0",
            "created": "2011-09-16 22:02:19",
            "reason": "Unable to resolve MX host sendgrid.ne",
            "email": "esting@sendgrid.ne"
          }
        ]'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/bounces.delete.json') do
      let(:action) { subject.delete }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
