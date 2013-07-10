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
end
