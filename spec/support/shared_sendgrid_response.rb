shared_examples "a sendgrid response" do |path|
  let(:test_connection) { double(:connection) }

  before do
    test_connection.stub(:post).
      with(path, anything).
      and_return(double(:response, code: 200, body: response))
    subject.stub(:connection).and_return(test_connection)
  end

  it "makes a json request to #{path}" do
    params = double(:parameters)
    subject.stub(:default_params) { params }
    test_connection.should_receive(:post).
      with(path, params)
    action
  end

  it 'returns a Sendgrid::Web::Response' do
    result = action
    result.should be_instance_of(Sendgrid::Web::Response)
    result.status_code.should eql(200)
    result.raw_body.should eql(response)
  end
end
