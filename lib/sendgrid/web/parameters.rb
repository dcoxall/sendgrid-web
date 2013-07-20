class Sendgrid::Web::Parameters < Hash

  def []=(key, value)
    super(key, _cleanse_value(value))
  end

  def merge!(hash = {})
    super(_cleanse(hash))
  end

  def merge(hash = {})
    super(_cleanse(hash))
  end

  def replace(hash = {})
    super(_cleanse(hash))
  end

  def store(key, value)
    super(key, _cleanse_value(value))
  end

  def update(hash = {})
    super(_cleanse(hash))
  end

  private

  def _cleanse(hash)
    cleansed = Sendgrid::Web::Parameters.new
    hash.each do |k, v|
      cleansed[k] = _cleanse_value(v)
    end
    cleansed
  end

  def _cleanse_value(value)
    if value.is_a?(Hash) || value.is_a?(Sendgrid::Web::Parameters)
      value = _cleanse(value)
    elsif value.is_a?(Array)
      value = value.collect { |v| _cleanse_value(v) }
    elsif value.respond_to?(:strftime)
      value = value.strftime('%Y-%m-%d')
    else
      value = value.to_s
    end
    value
  end

end
