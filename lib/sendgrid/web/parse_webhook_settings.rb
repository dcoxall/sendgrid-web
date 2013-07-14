class Sendgrid::Web::ParseWebhookSettings < Sendgrid::Web::Client

  # Retrieve settings already configured for parsing incoming email.
  #
  # @return [Sendgrid::Web::Response] The sendgrid response
  def get
    res = connection.post('/api/parse.get.json', default_params)
    craft_response(res)
  end

  # Specify the hostname and url for parsing incoming emails.
  #
  # @param hostname [String] The hostname (domain or subdomain) for
  #   which you would like to configure a Parse Webhook callback URL.
  # @param url [String] The callback URL to which Parse Webhook
  #   payloads will be POSTed.
  # @param spam_check [Integer] If spam check is enabled, messages
  #   that look like spam will not be POSTed.
  # @return [Sendgrid::Web::Response] The sendgrid response
  # @note +hostname+ and +url+ are required parameters.
  def set(hostname: nil, url: nil, spam_check: nil)
    if hostname.nil?
      raise ArgumentError.new('Missing required `hostname` option')
    elsif url.nil?
      raise ArgumentError.new('Missing required `url` option')
    end
    res = connection.post(
      '/api/parse.set.json',
      default_params(
        hostname: hostname,
        url: url,
        spam_check: spam_check))
    craft_response(res)
  end

  # Edit your existing settings for parsing incoming emails.
  #
  # @param hostname [String] The hostname (domain or subdomain) for
  #   which you would like to configure a Parse Webhook callback URL.
  # @param url [String] The callback URL to which Parse Webhook
  #   payloads will be POSTed.
  # @param spam_check [Integer] If spam check is enabled, messages
  #   that look like spam will not be POSTed.
  # @return [Sendgrid::Web::Response] The sendgrid response
  # @note +hostname+ and +url+ are required parameters.
  def edit(hostname: nil, url: nil, spam_check: nil)
    if hostname.nil?
      raise ArgumentError.new('Missing required `hostname` option')
    elsif url.nil?
      raise ArgumentError.new('Missing required `url` option')
    end
    res = connection.post(
      '/api/parse.edit.json',
      default_params(
        hostname: hostname,
        url: url,
        spam_check: spam_check))
    craft_response(res)
  end

  # Delete the existing settings for parsing incoming emails.
  #
  # @param hostname [String] The hostname (domain or subdomain) for
  #   which you would like to configure a Parse Webhook callback URL.
  # @return [Sendgrid::Web::Response] The sendgrid response
  # @note +hostname+ is a required parameter.
  def delete(hostname: nil)
    if hostname.nil?
      raise ArgumentError.new('Missing required `hostname` option')
    end
    res = connection.post(
      '/api/parse.delete.json',
      default_params(hostname: hostname))
    craft_response(res)
  end

end
