require 'spec_helper'

describe Sendgrid::Web::Parameters do

  describe 'is based on Hash' do
    subject { described_class }
    its(:superclass) { should eql(Hash) }
  end

  describe 'cleanses when setting values' do
    context DateTime do
      before { subject[:provider] = DateTime.new(2013, 01, 23) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context Time do
      before { subject[:provider] = Time.new(2013, 01, 23) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context true do
      before { subject[:provider] = true }
      it 'converts to "true"' do
        subject[:provider].should eql('true')
      end
    end
    context false do
      before { subject[:provider] = false }
      it 'converts to "false"' do
        subject[:provider].should eql('false')
      end
    end
  end

end
