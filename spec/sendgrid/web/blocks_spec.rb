require 'spec_helper'

describe Sendgrid::Web::Blocks do
  before(:all) do
    Sendgrid::Web::Client.configure do |config|
      config.username = 'foo'
      config.password = 'bar'
    end
  end

  describe '#get' do
    let(:test_connection) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.post('blocks.get.json') { [200, {}, 'sent blocks.get'] }
      end
    end

    before do
      subject.stub(:connection).and_return(test_connection)
    end

    it 'makes a json request to /blocks.get.json' do
      test_connection.should_receive(:post).
        with('blocks.get.json',
             hash_including(api_user: 'foo', api_key: 'bar')).
        and_call_original
      subject.get
    end
  end

  describe '#delete' do
    let(:test_connection) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.post('blocks.delete.json') { [200, {}, 'sent blocks.delete'] }
      end
    end

    before do
      subject.stub(:connection).and_return(test_connection)
    end

    it 'makes a json request to /blocks.delete.json' do
      test_connection.should_receive(:post).
        with('blocks.delete.json',
             hash_including(api_user: 'foo', api_key: 'bar', email: 'foobar@example.com')).
        and_call_original
      subject.delete(email: 'foobar@example.com')
    end
  end
end
