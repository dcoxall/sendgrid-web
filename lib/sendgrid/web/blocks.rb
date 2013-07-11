class Sendgrid::Web::Blocks < Sendgrid::Web::Client

  def get
    connection.post('blocks.get.json', default_params)
  end

  def delete(email: nil)
    raise ArgumentError.new('Missing required `email` option') if email.nil?
    connection.post('blocks.delete.json', default_params.merge(email: email))
  end

end
