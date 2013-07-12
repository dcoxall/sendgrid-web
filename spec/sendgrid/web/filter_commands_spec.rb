require 'spec_helper'

describe Sendgrid::Web::FilterCommands do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get_available' do
    it_behaves_like('a sendgrid response', '/api/filter.getavailable.json') do
      let(:action) { subject.get_available }
      let(:response) do
        '[
          {
            "name": "twitter",
            "title": "Twitter",
            "description": "This plugin allows you to send an email message to twitter",
            "activated": false
          }
        ]'
      end
    end
  end

  describe '#activate_app' do
    it_behaves_like('a sendgrid response', '/api/filter.activate.json') do
      let(:action) { subject.activate_app(name: 'twitter') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#deactivate_app' do
    it_behaves_like('a sendgrid response', '/api/filter.deactivate.json') do
      let(:action) { subject.deactivate_app(name: 'twitter') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#setup_app' do
    it_behaves_like('a sendgrid response', '/api/filter.setup.json') do
      let(:action) { subject.setup_app(name: 'twitter', username: 'foo', password: 'bar') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end

  describe '#get_settings' do
    it_behaves_like('a sendgrid response', '/api/filter.getsettings.json') do
      let(:action) { subject.get_settings(name: 'twitter') }
      let(:response) do
        '{
          "message": "success",
          "settings": [
            {
              "field_name": "field_value"
            }
          ]
        }'
      end
    end
  end
end
