require 'spec_helper'

describe Sendgrid::Web::Unsubscribes do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/unsubscribes.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "email": "brandon.west@sendgrid.com",
            "created": "2012-09-06 14:03:18"
          }
        ]'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/unsubscribes.delete.json') do
      let(:action) { subject.delete }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#add' do
    it_behaves_like('a sendgrid response', '/api/unsubscribes.add.json') do
      let(:action) { subject.add(email: 'foobar@example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
