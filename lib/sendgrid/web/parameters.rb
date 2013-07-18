class Sendgrid::Web::Parameters < Hash

  def []=(key, value)
    value = value.strftime('%Y-%m-%d') if value.respond_to?(:strftime)
    value = value.to_s
    super
  end

end
