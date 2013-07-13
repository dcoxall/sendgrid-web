class Sendgrid::Web::Response

  attr_reader :status_code, :raw_body, :parsed_body

  def initialize(status_code, body)
    @status_code = status_code.to_i
    @raw_body = body.to_s
    @parsed_body = ::Oj.safe_load(raw_body)
  end

  # Checks if the Sengrid response contained errors.
  #
  # @return [bool] True if there were errors found.
  def errors?
    !parsed_body.nil? &&
    parsed_body.is_a?(Hash) &&
    parsed_body.has_key?('errors')
  end

  # Fetches an array of error messages from the response.
  #
  # @return [Array<String>] A list of any error messages.
  def error_messages
    errors? ? parsed_body['errors'] : []
  end

end
