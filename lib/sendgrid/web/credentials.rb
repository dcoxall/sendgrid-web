class Sendgrid::Web::Credentials < Sendgrid::Web::Client

  # Retrieve a list of all credentials, or permissions for a specific
  # credential.
  #
  # @param username [String] If a username is supplied, the API
  #   returns the JSON permissions for that user.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note All parameters are optional
  def get(username: nil)
    res = connection.post(
      '/api/credentials/get.json',
      default_params(username: username))
    craft_response(res)
  end

  # This API call allows user to add a new set of credentials to their
  # account.
  #
  # @param username [String] Enter a username for the new account.
  # @param password [String] Enter a password for the new account.
  # @param permissions [Hash] There are three key names: +email+ for
  #   access to SMTP, +api+ for programmatic access, and +web+ for
  #   administration. The values for each are a bit, +0+ for off or
  #   +1+ for on.
  #
  #   The following example allows the specified username/password to
  #   log into the dashboard, but not send email or have access to any
  #   of the APIs:
  #
  #     { email: 0, web: 1, api: 0 }
  #
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note Requires +username+ and +password+.
  def add(username: nil, password: nil, permissions: nil)
    raise ArgumentError.new('Missing required `username` option') if username.nil?
    raise ArgumentError.new('Missing required `password` option') if password.nil?
    res = connection.post(
      '/api/credentials/add.json',
      default_params(
        username: username,
        password: password,
        permissions: permissions))
    craft_response(res)
  end

  # Update/edit a users credentials and permissions.
  #
  # @param username [String] The existing users username.
  # @param password [String] Optionally update the password.
  # @param permissions [Hash] Optionally update the permissions.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note Only +username+ is required.
  # @see #add
  def edit(username: nil, password: nil, permissions: nil)
    raise ArgumentError.new('Missing required `username` option') if username.nil?
    res = connection.post(
      '/api/credentials/edit.json',
      default_params(
        username: username,
        password: password,
        permissions: permissions))
    craft_response(res)
  end

  # Remove an individuals credentials.
  #
  # @param username [String] The credential to remove.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note +username+ is required.
  def delete(username: nil)
    raise ArgumentError.new('Missing required `username` option') if username.nil?
    res = connection.post(
      '/api/credentials/delete.json',
      default_params(
        username: username))
    craft_response(res)
  end

end
