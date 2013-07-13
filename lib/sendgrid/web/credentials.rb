class Sendgrid::Web::Credentials < Sendgrid::Web::Client

  def get(username: nil)
    res = connection.post('/api/credentials/get.json',
      default_params.merge(username: username))
    craft_response(res)
  end

  def add(username: nil, password: nil, permissions: nil)
    raise ArgumentError.new('Missing required `username` option') if username.nil?
    raise ArgumentError.new('Missing required `password` option') if password.nil?
    res = connection.post('/api/credentials/add.json', 
      default_params.merge(
        username: username,
        password: password,
        permissions: permissions))
    craft_response(res)
  end

  def edit(username: nil, password: nil, permissions: nil)
    raise ArgumentError.new('Missing required `username` option') if username.nil?
    res = connection.post('/api/credentials/edit.json', 
      default_params.merge(
        username: username,
        password: password,
        permissions: permissions))
    craft_response(res)
  end

  def delete(username: nil)
    raise ArgumentError.new('Missing required `username` option') if username.nil?
    res = connection.post('/api/credentials/delete.json', 
      default_params.merge(
        username: username))
    craft_response(res)
  end

end
