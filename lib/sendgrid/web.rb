require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'
require 'sendgrid/web/version'

module Sendgrid
  module Web
    autoload :Configurator, 'sendgrid/web/configurator'
    autoload :Client, 'sendgrid/web/client'
    autoload :Blocks, 'sendgrid/web/blocks'
    autoload :Bounces, 'sendgrid/web/bounces'
  end
end
