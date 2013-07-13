class Sendgrid::Web::Mail < Sendgrid::Web::Client

  # Send an email.
  #
  # @param to [String|Array<String>] This can also be passed in as an
  #   array, to send to multiple locations. Note that recipients
  #   passed in this parameter will be visible as part of the message.
  # @param to_name [String|Array<String>] Give a name to the
  #   recipient.
  # @param x_smtpapi [Hash] see
  #   {http://sendgrid.com/docs/API_Reference/SMTP_API/index.html X-SMTP API}
  #   for details.
  # @param subject [String] The subject of your email.
  # @param text [String] The actual content of your email message.
  # @param html [String] The actual content of your email message.
  # @param from [String] This is where the email will appear to
  #   originate from for your recipient.
  # @param bcc [String|Array<String>] This can also be passed in as an
  #   array of email addresses for multiple recipients.
  # @param from_name [String] This is name appended to the from email
  #  field.
  # @param reply_to [String] Append a reply-to field to your email
  #   message.
  # @param date [DateTime] Specify the date header of your email.
  # @param files [Array] Files to be attached. The file contents must
  #   be part of the multipart HTTP POST.
  # @param content [Hash] Content IDs of the files to be used as
  #   inline images. Content IDs should match the cid’s used in the
  #   HTML markup.
  # @param headers [Hash] Each key represents a header name and the
  #   value the header value.
  # @return [Sendgrid::Web::Response] The Sendgrid response.
  # @note The required parameters are: +from+, +text+/+html+,
  #   +subject+ and +to+.
  def send(
    to: nil, to_name: nil, x_smtpapi: nil,
    subject: nil, text: nil, html: nil,
    from: nil, bcc: nil, from_name: nil,
    reply_to: nil, date: nil, files: nil,
    content: nil, headers: nil)
    options = {
      'to' => to, 'toname' => to_name, 'x-smtpapi' => x_smtpapi,
      'subject' => subject, 'text' => text, 'html' => html,
      'from' => from, 'bcc' => bcc, 'fromname' => from_name,
      'replyto' => reply_to, 'date' => date, 'files' => files,
      'content' => content, 'headers' => headers }
    %w{ subject to }.each do |required_option|
      if options[required_option].nil?
        raise ArgumentError.new(
          "Missing required `#{required_option}` option")
      end
    end
    if options['text'].nil? && options['html'].nil?
      raise ArgumentError.new(
        'Missing required `text` or `html` option')
    end
    res = connection.post(
      '/api/mail.send.json',
      default_params(options))
    craft_response(res)
  end

end
