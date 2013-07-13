class Sendgrid::Web::Client

  # Sets the global configuration object shared between all clients.
  # You can use it like so:
  #
  #   Sendgrid::Web::Client.configure do |config|
  #     config.username = 'foo'
  #     config.password = 'bar'
  #   end
  #
  # @return [Sendgrid::Web::Configurator]
  def self.configure(&block)
    @@config = Sendgrid::Web::Configurator.new(&block)
  end

  # Retrieve the current global configuration object and if none
  # exists, then create an empty one.
  #
  # @see #config
  def self.config
    @@config ||= Sendgrid::Web::Configurator.new
  end

  # Returns the configured +root_url+.
  def self.base_uri
    config.root_url
  end

  # Retrieve the current global configuration object and if none
  # exists, then create an empty one.
  #
  # @see .config
  def config
    @@config ||= Sendgrid::Web::Configurator.new
  end

  private

  class API
    include ::HTTParty
    base_uri Sendgrid::Web::Client.config.root_url
  end

  def config=(configurator)
    @@config = configurator
  end

  def connection
    @connection = API
  end

  def default_params(additions = {})
    defaults = {
      query: {
        api_user: config.username,
        api_key:  config.password
      }
    }
    defaults[:query].merge!(additions)
    defaults
  end

  def craft_response(response)
    Sendgrid::Web::Response.new(response.code, response.body)
  end

end
