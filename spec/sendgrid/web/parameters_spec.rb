require 'spec_helper'

using Sendgrid::Web::Parameters

describe Sendgrid::Web::Parameters do

  describe '#cleanse!' do

    describe 'handles objects that respond to #strftime' do
      context DateTime do
        it 'converts values to YYYY-MM-DD' do
          hash = { provider: DateTime.new(2013, 01, 23) }
          hash.cleanse!
          hash[:provider].should eql('2013-01-23')
        end
      end
      context Time do
        it 'converts values to YYYY-MM-DD' do
          hash = { provider: Time.new(2013, 01, 23) }
          hash.cleanse!
          hash[:provider].should eql('2013-01-23')
        end
      end
    end

    describe 'handles booleans' do
      it 'converts values to "true"' do
        hash = { provider: true }
        hash.cleanse!
        hash[:provider].should eql('true')
      end
      it 'converts values to "false"' do
        hash = { provider: false }
        hash.cleanse!
        hash[:provider].should eql('false')
      end
    end

    it 'is recursive' do
      hash = { provider: { date: DateTime.new(2013, 01, 23) } }
      hash.cleanse!
      hash[:provider][:date].should eql('2013-01-23')
    end

  end

  describe '#cleanse' do
    it 'creates a new Hash instance' do
      hash = Hash.new
      dup_hash = double(:dup_hash)
      dup_hash.should_receive(:cleanse!)
      hash.should_receive(:dup).
        and_return(dup_hash)
      hash.cleanse
    end
  end

end
