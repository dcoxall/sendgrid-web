class Sendgrid::Web::Response

  attr_reader :status_code, :raw_body, :parsed_body

  def initialize(status_code, body)
    @status_code = status_code.to_i
    @raw_body = body.to_s
    @parsed_body = ::Oj.safe_load(raw_body)
  end

  def errors?
    !parsed_body.nil? && 
    parsed_body.is_a?(Hash) &&
    parsed_body.has_key?('errors')
  end

  def error_messages
    errors? ? parsed_body['errors'] : []
  end

end
