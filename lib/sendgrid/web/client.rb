class Sendgrid::Web::Client
  def self.configure(&block)
    @@config = Sendgrid::Web::Configurator.new(&block)
  end

  def self.config
    @@config
  end
end
