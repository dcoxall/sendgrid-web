require "sendgrid/web/version"

module Sendgrid
  class Web
    autoload :Configurator, 'sendgrid/web/configurator'

    cattr_reader :config

    def self.configure(&block)
      @@config = Configurator.new(block)
    end

  end
end
