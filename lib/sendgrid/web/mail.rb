class Sendgrid::Web::Mail < Sendgrid::Web::Client

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
      raise ArgumentError.new("Missing required `#{required_option}` option") if options[required_option].nil?
    end
    if options['text'].nil? && options['html'].nil?
      raise ArgumentError.new('Missing required `text` or `html` option')
    end
    res = connection.post('/api/mail.send.json', default_params.merge(options))
    craft_response(res)
  end

end
