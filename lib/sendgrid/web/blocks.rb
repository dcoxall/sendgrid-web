class Sendgrid::Web::Blocks < Sendgrid::Web::Client

  # Retrieves a list of all blocked email addresses along with the
  # reason why they are blocked.
  #
  # @param date [Integer] Retrieve the timestamp of the Block records.
  # @param days [Integer] Number of days in the past for which to
  #   retrieve blocks (includes today)
  # @param start_date [DateTime] The start of the date range for which
  #   to retrieve blocks.
  # @param end_date [DateTime] The end of the date range for which to
  #   retrieve blocks.
  # @param limit [Integer] Optional field to limit the number of
  #   results returned.
  # @param offset [Integer] Optional beginning point in the list to
  #   retrieve from.
  # @return [Sendgrid::Web::Response] The sendgrid response
  # @note All parameters are optional
  def get(
    date: nil, days: nil, start_date: nil,
    end_date: nil, limit: nil, offset: nil)
    res = connection.post(
      '/api/blocks.get.json',
      default_params(
        date: date,
        days: days,
        start_date: start_date,
        end_date: end_date,
        limit: limit,
        offset: offset))
    craft_response(res)
  end

  # Deletes all blocks associated with the provided email
  #
  # @param email [String] Email block address to remove
  # @return [Sendgrid::Web::Response] The sendgrid response
  def delete(email: nil)
    if email.nil?
      raise ArgumentError.new('Missing required `email` option')
    end
    res = connection.post(
      '/api/blocks.delete.json',
      default_params(email: email))
    craft_response(res)
  end

end
