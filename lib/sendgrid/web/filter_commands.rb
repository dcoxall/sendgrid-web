class Sendgrid::Web::FilterCommands < Sendgrid::Web::Client

  # List all of the available apps.
  #
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note The name entry is used in all the other API calls to
  #   identify the app.
  def get_available
    res = connection.post(
      '/api/filter.getavailable.json',
      default_params)
    craft_response(res)
  end

  # Activate an app.
  #
  # @param name [String] The app in which to activate.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note +name+ is required.
  def activate_app(name: nil)
    raise ArgumentError.new('Missing required `name` option') if name.nil?
    res = connection.post(
      '/api/filter.activate.json',
      default_params(name: name))
    craft_response(res)
  end

  # Deactivate an app.
  #
  # @param name [String] The app in which to deactivate.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note +name+ is required.
  def deactivate_app(name: nil)
    raise ArgumentError.new('Missing required `name` option') if name.nil?
    res = connection.post(
      '/api/filter.deactivate.json',
      default_params(name: name))
    craft_response(res)
  end

  # Update an apps settings.
  #
  # @param name [String] The app in which to update.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note Other options are dependant on the app in question.
  def setup_app(options = {})
    raise ArgumentError.new('Missing required `name` option') if options[:name].nil?
    res = connection.post(
      '/api/filter.setup.json',
      default_params(options))
    craft_response(res)
  end

  # Retrieve the settings of an app.
  #
  # @param name [String] The app in which to retrieve.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note +name+ is required.
  def get_settings(name: nil)
    raise ArgumentError.new('Missing required `name` option') if name.nil?
    res = connection.post(
      '/api/filter.getsettings.json',
      default_params(name: name))
    craft_response(res)
  end

end
