class Sendgrid::Web::Configurator
  attr_accessor :username, :password

  def initialize(&block)
    yield self if block_given?
  end
end
