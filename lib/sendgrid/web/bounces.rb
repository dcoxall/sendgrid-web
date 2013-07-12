class Sendgrid::Web::Bounces < Sendgrid::Web::Client

  def get
    res = connection.post('/api/bounces.get.json', default_params)
    craft_response(res)
  end

  def delete(start_date: nil, end_date: nil, type: nil, email: nil)
    res = connection.post('/api/bounces.delete.json',
      default_params.merge(
        start_date: start_date,
        end_date: end_date,
        type: type,
        email: email))
    craft_response(res)
  end

end
