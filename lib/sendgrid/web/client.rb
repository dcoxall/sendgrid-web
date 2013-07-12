class Sendgrid::Web::Client

  def self.configure(&block)
    @@config = Sendgrid::Web::Configurator.new(&block)
  end

  def self.config
    @@config ||= Sendgrid::Web::Configurator.new
  end

  def self.base_uri
    config.root_url
  end

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

  def default_params
    {
      api_user: config.username,
      api_key:  config.password
    }
  end

  def craft_response(response)
    Sendgrid::Web::Response.new(response.code, response.body)
  end

end
