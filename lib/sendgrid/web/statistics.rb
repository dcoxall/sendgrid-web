class Sendgrid::Web::Statistics < Sendgrid::Web::Client

  # Retrieve statistics and data about your use of SendGrid.
  #
  # @param days [Integer] Number of days in the past to include
  #   statistics (Includes today).
  # @param start_date [DateTime] The start date to look up statistics.
  # @param end_date [DateTime] The end date to look up statistics.
  # @param aggregate [Integer] This is used to indicate you are
  #   interested in all-time totals.
  # @param list [bool] Determins if SendGrid should return a list of
  #   categories.
  # @param category [String] The category you will specify to retrieve
  #   detailed stats.
  # @return [Sendgrid::Web::Response] The SendGrid response.
  # @note All parameters are optional.
  def get(
    days: nil, start_date: nil, end_date: nil,
    aggregate: nil, list: nil, category: nil)
    res = connection.post(
      '/api/stats.get.json',
      default_params(
        days: days,
        start_date: start_date,
        end_date: end_date,
        aggregate: aggregate,
        list: list,
        category: category))
    craft_response(res)
  end

  # Retrieve more advanced and in-depth statistics.
  #
  # @param data_type [String] Must be one of the following:
  #   - +browsers+: Browser data obtained from click events.
  #   - +clients+: Email client data obtained from open events.
  #   - +devices+: Device data obtained from open events.
  #   - +geo+: Geographical data obtained from multiple events.
  #   - +global+: Global account data obtained from multiple events.
  #   - +isps+: ISP data obtained from multiple events.
  # @param start_date [String] Date format is based on aggregated_by
  #   value (default is yyyy-mm-dd):
  #   - yyyy-mm-dd (i.e 2012-12-13) if aggregated_by=day (default)
  #   - yyyy-ww (i.e 2012-43) if aggregated_by=week
  #   - yyyy-mm (i.e 2012-11) if aggregated_by=month
  # @param end_date [String] Date format is based on aggregated_by
  #   value (default is yyyy-mm-dd):
  #   - yyyy-mm-dd (i.e 2012-12-13) if aggregated_by=day (default)
  #   - yyyy-ww (i.e 2012-43) if aggregated_by=week
  #   - yyyy-mm (i.e 2012-11) if aggregated_by=month
  # @param metric [String] One of the following (default is all):
  #   - +open+: Opens
  #   - +click+: Clicks
  #   - +unique_open+: Unique opens
  #   - +unique_click+: Unique clicks
  #   - +processed+: Processed emails
  #   - +delivered+: Delivered emails
  #   - +drop+: Dropped emails
  #   - +bounce+: Bounced emails
  #   - +deferred+: Deferred email tries
  #   - +spamreport+: Emails marked as spam
  #   - +blocked+: Emails that have been blocked
  #   - +all+: All metrics are returned
  # @param category [String] Return stats for the given category.
  # @param aggregated_by [String] Aggregate the data by the given
  #   period (default is day):
  #   - +day+: Keys are returned in the format yyyy-mm-dd
  #     (i.e 2012-12-13)
  #   - +week+: Keys are return in the format yyyy-ww (i.e 2012-43)
  #   - +month+: Keys are return in the format yyyy-mm (i.e 2012-11)
  # @param country [String] Get stats for each region/state for the
  #   given country. Only US (United States) and CA (Canada) is
  #   supported at this time. Country code is two letter characters
  #   based on {http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 ISO 3166-1 alpha-2}.
  #
  #   This parameter is only used for when data_type=geo
  # @return [Sendgrid::Web::Response] The SendGrid response.
  # @note The +data_type+ and +start_date+ parameters are required.
  def get_advanced(
    data_type: nil, start_date: nil, end_date: nil,
    metric: nil, category: nil, aggregated_by: nil,
    country: nil)
    if data_type.nil?
      raise ArgumentError.new('Missing required `data_type` option')
    elsif start_date.nil?
      raise ArgumentError.new('Missing required `start_date` option')
    end
    res = connection.post(
      '/api/stats.getAdvanced.json',
      default_params(
        data_type: data_type,
        start_date: start_date,
        end_date: end_date,
        metric: metric,
        category: category,
        aggregated_by: aggregated_by,
        country: country))
    craft_response(res)
  end

end
