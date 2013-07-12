require 'oj'
require 'httparty'
require 'sendgrid/web/version'

module Sendgrid
  module Web
    autoload :Configurator, 'sendgrid/web/configurator'
    autoload :Client,       'sendgrid/web/client'
    autoload :Blocks,       'sendgrid/web/blocks'
    autoload :Bounces,      'sendgrid/web/bounces'
    autoload :FilterCommands, 'sendgrid/web/filter_commands'
    autoload :Response,     'sendgrid/web/response'
  end
end
