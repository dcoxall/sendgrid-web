class Sendgrid::Web::Configurator
  attr_accessor :username, :password, :root_url

  def initialize(&block)
    self.root_url = 'https://sendgrid.com'
    yield self if block_given?
  end
end
