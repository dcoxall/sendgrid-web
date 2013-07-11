class Sendgrid::Web::Client
  def self.configure(&block)
    @@config = Sendgrid::Web::Configurator.new(&block)
  end

  def self.config
    @@config
  end

  def config
    @@config ||= Sendgrid::Web::Configurator.new
  end

  private

  def config=(configurator)
    @@config = configurator
  end

  def connection
    @connection ||= Faraday.new(:url => config.root_url) do |faraday|
      faraday.request :url_encoded
      faraday.adapter :typhoeus
    end
  end

  def default_params
    {
      api_user: config.username,
      api_key:  config.password
    }
  end
end
