class Sendgrid::Web::Bounces < Sendgrid::Web::Client

  # Retrieve a list of bounces with addresses and response codes,
  # optionally with dates.
  #
  # @param date [Integer] Retrieve the timestamp of the bounce
  #   records.
  # @param days [Integer] Number of days in the past for which to
  #   retrieve bounces (includes today)
  # @param start_date [DateTime] The start of the date range for which to
  #   retrieve bounces.
  # @param end_date [DateTime] The end of the date range for which to
  #   retrieve bounces.
  # @param limit [Integer] Optional field to limit the number of
  #   results returned.
  # @param offset [Integer] Optional beginning point in the list to
  #   retrieve from.
  # @param type [String] Choose the type of bounce to search for. Can
  #   be either +hard+ or +soft+.
  # @param email [String] Optional email addresses to search for.
  # @return [Sendgrid::Web::Response] The sendgrid response
  # @note All parameters are optional
  def get(
    date: nil, days: nil, start_date: nil,
    end_date: nil, limit: nil, offset: nil,
    type: nil, email: nil)
    res = connection.post(
      '/api/bounces.get.json',
      default_params(
        date: date,
        days: days,
        start_date: start_date,
        end_date: end_date,
        limit: limit,
        offset: offset,
        type: type,
        email: email))
    craft_response(res)
  end

  # Delete an address from the Bounce list.
  #
  # @param start_date [DateTime] Optional date to start deleting from.
  # @param end_date [DateTime] Optional date to end deleting from.
  # @param type [String] Choose the type of bounce to be removed. Can
  #   be either +hard+ or +soft+.
  # @param email [String] Email bounce address to remove.
  # @return [Sendgrid::Web::Response] The sendgrid response
  # @note All parameters are optional
  # @note If no parameters are specified the ENTIRE list will be
  #   deleted.
  def delete(
    start_date: nil, end_date: nil, type: nil,
    email: nil)
    res = connection.post('/api/bounces.delete.json',
      default_params(
        start_date: start_date,
        end_date: end_date,
        type: type,
        email: email))
    craft_response(res)
  end

end
