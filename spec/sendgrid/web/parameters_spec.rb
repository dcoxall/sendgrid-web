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

  describe 'cleanses when merging' do
    context DateTime do
      before { subject.merge!(provider: DateTime.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context Time do
      before { subject.merge!(provider: Time.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context true do
      before { subject.merge!(provider: true) }
      it 'converts to "true"' do
        subject[:provider].should eql('true')
      end
    end
    context false do
      before { subject.merge!(provider: false) }
      it 'converts to "false"' do
        subject[:provider].should eql('false')
      end
    end
    it 'into new Parameters' do
      params = subject.merge(provider: true)
      params.should be_instance_of(Sendgrid::Web::Parameters)
      params[:provider].should eql('true')
      params.object_id.should_not eql(subject.object_id)
    end
  end

  describe 'cleanses when replacing' do
    context DateTime do
      before { subject.replace(provider: DateTime.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context Time do
      before { subject.replace(provider: Time.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context true do
      before { subject.replace(provider: true) }
      it 'converts to "true"' do
        subject[:provider].should eql('true')
      end
    end
    context false do
      before { subject.replace(provider: false) }
      it 'converts to "false"' do
        subject[:provider].should eql('false')
      end
    end
  end

  describe 'cleanses when storing' do
    context DateTime do
      before { subject.store(:provider, DateTime.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context Time do
      before { subject.store(:provider, Time.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context true do
      before { subject.store(:provider, true) }
      it 'converts to "true"' do
        subject[:provider].should eql('true')
      end
    end
    context false do
      before { subject.store(:provider, false) }
      it 'converts to "false"' do
        subject[:provider].should eql('false')
      end
    end
  end

  describe 'cleanses when updating' do
    context DateTime do
      before { subject.update(provider: DateTime.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context Time do
      before { subject.update(provider: Time.new(2013, 01, 23)) }
      it 'converts to YYYY-MM-DD format' do
        subject[:provider].should eql('2013-01-23')
      end
    end
    context true do
      before { subject.update(provider: true) }
      it 'converts to "true"' do
        subject[:provider].should eql('true')
      end
    end
    context false do
      before { subject.update(provider: false) }
      it 'converts to "false"' do
        subject[:provider].should eql('false')
      end
    end
  end

end
