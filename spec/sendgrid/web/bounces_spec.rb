require 'spec_helper'

describe Sendgrid::Web::Bounces do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    let(:test_connection) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.post('bounces.get.json') { [200, {}, 'sent bounces.get'] }
      end
    end

    before do
      subject.stub(:connection).and_return(test_connection)
    end

    it 'makes a json request to /bounces.get.json' do
      test_connection.should_receive(:post).
        with('bounces.get.json',
             hash_including(api_user: 'foo', api_key: 'bar')).
        and_call_original
      subject.get
    end
  end

  describe '#delete' do
    let(:test_connection) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.post('bounces.delete.json') { [200, {}, 'sent bounces.delete'] }
      end
    end

    before do
      subject.stub(:connection).and_return(test_connection)
    end

    it 'makes a json request to /bounces.delete.json' do
      test_connection.should_receive(:post).
        with('bounces.delete.json',
             hash_including(api_user: 'foo', api_key: 'bar', email: 'foobar@example.com')).
        and_call_original
      subject.delete(email: 'foobar@example.com')
    end
  end
end
