require 'oj'
require 'httparty'

module Sendgrid
  module Web
    autoload :VERSION,        'sendgrid/web/version'
    autoload :Configurator,   'sendgrid/web/configurator'
    autoload :ParameterParser,'sendgrid/web/parameter_parser'
    autoload :Client,         'sendgrid/web/client'
    autoload :Blocks,         'sendgrid/web/blocks'
    autoload :Bounces,        'sendgrid/web/bounces'
    autoload :FilterCommands, 'sendgrid/web/filter_commands'
    autoload :InvalidEmails,  'sendgrid/web/invalid_emails'
    autoload :Mail,           'sendgrid/web/mail'
    autoload :Credentials,    'sendgrid/web/credentials'
    autoload :ParseWebhookSettings, 'sendgrid/web/parse_webhook_settings'
    autoload :Profile,        'sendgrid/web/profile'
    autoload :SpamReports,    'sendgrid/web/spam_reports'
    autoload :Unsubscribes,   'sendgrid/web/unsubscribes'
    autoload :Statistics,     'sendgrid/web/statistics'
    autoload :Response,       'sendgrid/web/response'
  end
end
