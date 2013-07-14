require 'spec_helper'

describe Sendgrid::Web::Statistics do
  describe '#get' do
    it_behaves_like('a sendgrid response', '/api/stats.get.json') do
      let(:action) { subject.get }
      let(:response) do
        '[
          {
            "date": "2009-06-20",
            "requests": 12342,
            "bounces": 12,
            "clicks": 10223,
            "opens": 9992,
            "spamreports": 5,
            "unique_clicks": 3,
            "unique_opens": 6,
            "blocked": 7
          }
        ]'
      end
    end
  end

  describe '#get_advanced' do
    it_behaves_like('a sendgrid response', '/api/stats.getAdvanced.json') do
      let(:action) { subject.get_advanced(
        data_type: :global,
        start_date: DateTime.new(2013, 01, 01)) }
      let(:response) do
        '[
          {
            "delivered": 41,
            "request": 41,
            "unique_open": 1,
            "unique_click": 1,
            "processed": 41,
            "date": "2013-01-01",
            "open": 2,
            "click": 1
          }
        ]'
      end
    end
  end
end
