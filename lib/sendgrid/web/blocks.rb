class Sendgrid::Web::Blocks < Sendgrid::Web::Client

  def get
    res = connection.post('/api/blocks.get.json', default_params)
    craft_response(res)
  end

  def delete(email: nil)
    raise ArgumentError.new('Missing required `email` option') if email.nil?
    res = connection.post('/api/blocks.delete.json', default_params.merge(email: email))
    craft_response(res)
  end

end
