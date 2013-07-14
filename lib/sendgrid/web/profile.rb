class Sendgrid::Web::Profile < Sendgrid::Web::Client

  # View your SendGrid profile.
  #
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note All parameters are optional
  def get
    res = connection.post('/api/profile.get.json', default_params)
    craft_response(res)
  end

  # Update your SendGrid profile.
  #
  # @param first_name [String] Your first name.
  # @param last_name [String] Your last name.
  # @param address [String] Your company address.
  # @param city [String] City where your company is located.
  # @param state [String] State where your company is located.
  # @param country [String] Country where your company is located.
  # @param zip [String] Zipcode/Postcode where your company is
  #   located.
  # @param phone [String] Valid phone number.
  # @param website [String] Your companies website.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note All parameters are optional
  def set(
    first_name: nil, last_name: nil, address: nil,
    city: nil, state: nil, country: nil,
    zip: nil, phone: nil, website: nil)
    res = connection.post(
      '/api/profile.set.json',
      default_params(
        first_name: first_name,
        last_name: last_name,
        address: address,
        city: city,
        state: state,
        country: country,
        zip: zip,
        phone: phone,
        website: website))
    craft_response(res)
  end

  # Update your password.
  #
  # @param password [String] Your new password.
  # @param confirm_password [String] Confirm your new password.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note +password+ and +confirm_password+ are required.
  # @see #set_username
  # @see #set_email
  def set_password(password: nil, confirm_password: nil)
    if password.nil?
      raise ArgumentError.new('Missing required `password` option')
    elsif confirm_password.nil?
      raise ArgumentError.new(
        'Missing required `confirm_password` option')
    end
    res = connection.post(
      '/api/password.set.json',
      default_params(
        password: password,
        confirm_password: confirm_password))
    craft_response(res)
  end

  # Update your username.
  #
  # @param username [String] This is the new username we will be
  #   authenticating with our SMTP servers and our website. Changes
  #   take effect immediately.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note Only +username+ is required.
  # @note Your account username is used to login to the SMTP server
  #   and the website. Changes will take effect immediately.
  # @see #set_password
  # @see #set_email
  def set_username(username: nil)
    if username.nil?
      raise ArgumentError.new('Missing required `username` option')
    end
    res = connection.post(
      '/api/profile.setUsername.json',
      default_params(username: username))
    craft_response(res)
  end

  # Update your email address.
  #
  # @param email [String] This is the new email address SendGrid will
  #   be contacting you with. Changes take effect immediately.
  # @return [Sendgrid::Web::Response] the Sendgrid response.
  # @note Only +email+ is required.
  # @note SendGrid send out a confirmation email to the new email
  #   account in order to be validated. Your email address changes
  #   when you click on the confirmation link.
  # @see #set_password
  # @see #set_username
  def set_email(email: nil)
    if email.nil?
      raise ArgumentError.new('Missing required `email` option')
    end
    res = connection.post(
      '/api/profile.setEmail.json',
      default_params(email: email))
    craft_response(res)
  end

end
