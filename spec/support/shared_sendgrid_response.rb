shared_examples "a sendgrid response" do |path|
  let(:test_connection) { double(:connection) }
    
  before do
    test_connection.stub(:post).
      with(path, anything).
      and_return(double(:response, code: 200, body: response))
    subject.stub(:connection).and_return(test_connection)
  end

  it "makes a json request to #{path}" do
    test_connection.should_receive(:post).
      with(path, hash_including(
        api_user: 'foo',
        api_key: 'bar'))
    action
  end

  it 'returns a Sendgrid::Web::Response' do
    result = action
    result.should be_instance_of(Sendgrid::Web::Response)
    result.status_code.should eql(200)
    result.raw_body.should eql(response)
  end
end
