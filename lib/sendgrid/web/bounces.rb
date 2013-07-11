class Sendgrid::Web::Bounces < Sendgrid::Web::Client

  def get
    connection.post('bounces.get.json', default_params)
  end

  def delete(start_date: nil, end_date: nil, type: nil, email: nil)
    connection.post('bounces.delete.json',
      default_params.merge(
        start_date: start_date,
        end_date: end_date,
        type: type,
        email: email))
  end

end
