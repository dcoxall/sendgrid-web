class Sendgrid::Web::InvalidEmails < Sendgrid::Web::Client

  # Retrieve a list of invalid emails with addresses and response
  # codes, optionally with dates.
  #
  # @param date [Integer] Retrieve the timestamp of the invalid email
  #   records.
  # @param days [Integer] Number of days in the past for which to
  #   retrieve invalid emails (includes today).
  # @param start_date [DateTime] The start of the date range for which
  #   to retrieve invalid emails.
  # @param end_date [DateTime] The end of the date range for which to
  #   retrieve invalid emails.
  # @param limit [Integer] Optional field to limit the number of
  #   results returned.
  # @param offset [Integer] Optional beginning point in the list to
  #   retrieve from.
  # @param email [String] Optional email addresses to search for.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note All parameters are optional.
  def get(
    date: nil, days: nil, start_date: nil,
    end_date: nil, limit: nil, offset: nil,
    email: nil)
    res = connection.post(
      '/api/invalidemails.get.json',
      default_params(
        date: date,
        days: days,
        start_date: start_date,
        end_date: end_date,
        limit: limit,
        offset: offset,
        email: email))
    craft_response(res)
  end

  # Delete an address from the Invalid Email list.
  #
  # @param email [String] Email address to remove.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note +email+ parameter is required.
  def delete(email: nil)
    raise ArgumentError.new('Missing required `email` option') if email.nil?
    res = connection.post(
      '/api/invalidemails.delete.json',
      default_params(email: email))
    craft_response(res)
  end

end
