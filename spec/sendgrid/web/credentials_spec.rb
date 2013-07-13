require 'spec_helper'

describe Sendgrid::Web::Credentials do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/credentials/get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "id": 4,
            "name": "johnsmith",
            "permissions": {
              "email": 0,
              "api": 1
            }
          }
        ]'
      end
    end
  end

  describe '#add' do
    it_behaves_like('a sendgrid response', '/api/credentials/add.json') do
      let(:action) { subject.add(username: 'foobar', password: 'foobar') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#edit' do
    it_behaves_like('a sendgrid response', '/api/credentials/edit.json') do
      let(:action) { subject.edit(username: 'foobar') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#delete' do
    it_behaves_like('a sendgrid response', '/api/credentials/delete.json') do
      let(:action) { subject.delete(username: 'foobar') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
