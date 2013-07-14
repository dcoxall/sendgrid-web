require 'spec_helper'

describe Sendgrid::Web::Profile do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/profile.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[{
          "username": "sampleuser@example.com",
          "email": "sampleemail@example.com",
          "active": "true",
          "first_name": "john",
          "last_name": "doe",
          "address": "555 any street",
          "city": "any city",
          "state": "CA",
          "zip": "91234",
          "country": "US",
          "phone": "555-555-5555",
          "website": "example.com"
        }]'
      end
    end
  end

  describe '#set' do
    it_behaves_like('a sendgrid response', '/api/profile.set.json') do
      let(:action) { subject.set }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#set_password' do
    it_behaves_like('a sendgrid response', '/api/password.set.json') do
      let(:action) { subject.set_password(
        password: 'foobar',
        confirm_password: 'foobar') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#set_username' do
    it_behaves_like('a sendgrid response', '/api/profile.setUsername.json') do
      let(:action) { subject.set_username(username: 'foobar') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#set_email' do
    it_behaves_like('a sendgrid response', '/api/profile.setEmail.json') do
      let(:action) { subject.set_email(
        email: 'foobar@example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
