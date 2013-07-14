class Sendgrid::Web::Unsubscribes < Sendgrid::Web::Client

  # Retrieve a list of Unsubscribes with addresses and optionally with
  # dates.
  #
  # @param date [Integer] Retrieve the timestamp of the unsubscribe
  #   records.
  # @param days [Integer] Number of days in the past for which to
  #   retrieve unsubscribe records (includes today).
  # @param start_date [DateTime] The start of the date range for which
  #   to retrieve unsubscribe records.
  # @param end_date [DateTime] The end of the date range for which to
  #   retrieve unsubscribe records.
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
      '/api/unsubscribes.get.json',
      default_params(
        date: date,
        days: days,
        start_date: start_date,
        end_date: end_date,
        limit: limit,
        offset: offset))
    craft_response(res)
  end

  # Delete an address from the Unsubscribe list.
  #
  # @param start_date [DateTime] Optional date to start retrieving
  #   for.
  # @param end_date [DateTime] Optional date to end retrieving for.
  # @param email [String] Unsubscribed email address to remove.
  # @return [Sendgrid::Web::Response] The SendGrid response.
  # @note If no parameters are provided the ENTIRE list will be
  #   removed.
  def delete(
    start_date: nil, end_date: nil, email: nil)
    res = connection.post(
      '/api/unsubscribes.delete.json',
      default_params(
        start_date: start_date,
        end_date: end_date,
        email: email))
    craft_response(res)
  end

  # Add email addresses to the Unsubscribe list.
  #
  # @param email [String] Email address to add to unsubscribe list.
  # @return [Sendgrid::Web::Response] The SendGrid response.
  # @note +email+ is a required parameter.
  def add(email: nil)
    if email.nil?
      raise ArgumentError.new('Missing required `email` option')
    end
    res = connection.post(
      '/api/unsubscribes.add.json',
      default_params(email: email))
    craft_response(res)
  end

end
