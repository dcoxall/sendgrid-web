require "sendgrid/web/version"

module Sendgrid
  module Web
    autoload :Configurator, 'sendgrid/web/configurator'
    autoload :Client, 'sendgrid/web/client'
  end
end
