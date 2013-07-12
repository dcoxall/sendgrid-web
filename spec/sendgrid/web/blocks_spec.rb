require 'spec_helper'

describe Sendgrid::Web::Blocks do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/blocks.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "status": "4.0.0",
            "created": "2012-09-02 00:12:12",
            "reason": "550 Access denied...04d52d35b93501d500a9bca895ddad5cddd1a9f8486c89ace8c5e959398198cd49cd58288c9d11313975284d852811... (throttled)",
            "email": "example@juno.com"
          }
        ]'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/blocks.delete.json') do
      let(:action) { subject.delete(email: 'foobar@example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
