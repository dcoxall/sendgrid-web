class Sendgrid::Web::FilterCommands < Sendgrid::Web::Client

  def get_available
    res = connection.post('/api/filter.getavailable.json', default_params)
    craft_response(res)
  end

  def activate_app(name: nil)
    raise ArgumentError.new('Missing required `name` option') if name.nil?
    res = connection.post('/api/filter.activate.json', default_params.merge(name: name))
    craft_response(res)
  end

  def deactivate_app(name: nil)
    raise ArgumentError.new('Missing required `name` option') if name.nil?
    res = connection.post('/api/filter.deactivate.json', default_params.merge(name: name))
    craft_response(res)
  end

  def setup_app(options = {})
    raise ArgumentError.new('Missing required `name` option') if options[:name].nil?
    res = connection.post('/api/filter.setup.json', default_params.merge(options))
    craft_response(res)
  end

  def get_settings(name: nil)
    raise ArgumentError.new('Missing required `name` option') if name.nil?
    res = connection.post('/api/filter.getsettings.json', default_params.merge(name: name))
    craft_response(res)
  end

end
