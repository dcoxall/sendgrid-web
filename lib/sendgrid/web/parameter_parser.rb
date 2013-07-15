class Sendgrid::Web::ParameterParser

  # Parse a supplied hash to ensure that values are acceptable for the
  # SendGrid API parameters.
  # It converts objects that respond to #strftime into the YYYY-MM-DD
  # format.
  #
  # @params input_hash [Hash] The source hash in which to prepare for
  #   use within the API.
  # @return [Hash] The resulting Hash after values have been parsed
  #   and primed for use.
  # @note Fallback is to call #to_s which means numeric values aren't
  #   correctly comparable afterwards.
  def parse(input_hash)
    parsed_hash = Hash.new
    input_hash.each do |key, value|
      parsed_hash[key] = parse_value(value)
    end
    parsed_hash
  end

  private

  def parse_value(value)
    if value.respond_to?(:strftime)
      value.strftime("%Y-%m-%d")
    elsif value.is_a?(Hash)
      parse(value)
    else
      value.to_s
    end
  end

end
