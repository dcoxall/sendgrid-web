class Sendgrid::Web::SpamReports < Sendgrid::Web::Client

  # Retrieve entries in the Spam Reports list.
  #
  # @param date [Integer] Retrieve the timestamp of the spam reports
  #   records.
  # @param days [Integer] Number of days in the past for which to
  #   retrieve spam reports (includes today).
  # @param start_date [DateTime] The start of the date range for which
  #   to retrieve spam reports.
  # @param end_date [DateTime] The end of the date range for which to
  #   retrieve spam reports.
  # @param limit [Integer] Optional field to limit the number of
  #   results returned.
  # @param offset [Integer] Optional beginning point in the list to
  #   retrieve from.
  # @return [Sendgrid::Web::Response] The SendGrid response.
  # @note All parameters are optional.
  def get(
    date: nil, days: nil, start_date: nil,
    end_date: nil, limit: nil, offset: nil)
    res = connection.post(
      '/api/spamreports.get.json',
      default_params(
        date: date,
        days: days,
        start_date: start_date,
        end_date: end_date,
        limit: limit,
        offset: offset))
    craft_response(res)
  end

  # Deletes all spam reports associated with the provided email.
  #
  # @param email [String] Email spam reports address to remove.
  # @return [Sendgrid::Web::Response] The SendGrid response.
  # @note +email+ parameter is required.
  def delete(email: nil)
    if email.nil?
      raise ArgumentError.new('Missing required `email` option')
    end
    res = connection.post(
      '/api/spamreports.delete.json',
      default_params(email: email))
    craft_response(res)
  end

end
