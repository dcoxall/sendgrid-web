require 'spec_helper'

describe Sendgrid::Web::ParameterParser do

  describe 'handles objects that respond to #strftime' do
    context DateTime do
      let(:payload) do
        {
          provider: DateTime.new(2013, 01, 23)
        }
      end

      it 'by converting values to strings' do
        subject.parse(payload).should be_instance_of(Hash)
        subject.parse(payload).should eql(
          provider: '2013-01-23')
      end
    end
    context Time do
      let(:payload) do
        {
          provider: Time.new(2013, 01, 23)
        }
      end

      it 'by converting values to strings' do
        subject.parse(payload).should be_instance_of(Hash)
        subject.parse(payload).should eql(
          provider: '2013-01-23')
      end
    end
  end

  describe 'handles Hash instances' do
    let(:payload) do
      {
        provider: {
          date: DateTime.new(2013, 01, 23)
        }
      }
    end

    it 'by converting hash values to strings but returning a Hash' do
      subject.parse(payload)[:provider].should be_instance_of(Hash)
      subject.parse(payload)[:provider].should eql(
        date: '2013-01-23')
    end
  end

  describe 'handles boolean values' do
    let(:payload) do
      {
        true_val: true,
        false_val: false
      }
    end

    it 'by converting values to strings' do
      subject.parse(payload).should eql(
        true_val: 'true',
        false_val: 'false')
    end
  end

end
