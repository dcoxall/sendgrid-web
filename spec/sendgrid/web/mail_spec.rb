require 'spec_helper'

describe Sendgrid::Web::Mail do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#send' do
    it_behaves_like('a sendgrid response', '/api/mail.send.json') do
      let(:action) { subject.send(
        to: 'foobar@example.com',
        subject: 'Test Email',
        text: 'Sent using `sendgrid-web`',
        from: 'test@example.com') }
      let(:response) do
        '{
          "message": "success"
        }'
      end
    end
  end
end
