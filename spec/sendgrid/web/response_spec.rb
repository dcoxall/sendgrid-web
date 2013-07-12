require 'spec_helper'

describe Sendgrid::Web::Response do

  let(:valid_body) do
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

  let(:error_body) do
    '{
      "message": "error",
      "errors": [
        "error message one",
        "error message two"
      ]
    }'
  end

  let(:body) { valid_body }
  let(:status_code) { '200' }
  let(:response) { Sendgrid::Web::Response.new(status_code, body) }

  subject { response }

  it 'stores the response body' do
    subject.raw_body.should eql(body)
  end

  it 'stores the response status' do
    subject.status_code.should eql(status_code.to_i)
  end

  describe '#errors?' do
    subject { response.errors? }

    context 'when sendgrid returns a json error' do
      let(:body) { error_body }
      it { should be_true }
    end

    context 'when sendgrid returns a valid result' do
      let(:body) { valid_body }
      it { should be_false }
    end
  end

  describe '#error_messages' do
    subject { response.error_messages }

    context 'when sendgrid returns a json error' do
      let(:body) { error_body }
      it { should eql(['error message one', 'error message two']) }
    end

    context 'when sendgrid returns a valid result' do
      let(:body) { valid_body }
      it { should be_empty }
    end
  end

end
