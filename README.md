# Sendgrid::Web

Developed as a means to communicate effectively with the [Sendgrid Web API]
whilst utilising new Ruby 2.0.0 features. The aim is to become the go-to
library for interacting with Sendgrid via their web API.

[Sendgrid Web API]: http://sendgrid.com/docs/API_Reference/Web_API/

## Installation

Add this line to your application's Gemfile:

    gem 'sendgrid-web'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sendgrid-web

## Usage

First you will need to configure the client:

    Sendgrid::Web::Client.configure do |config|
      config.username = 'your sendgrid username'
      config.password = 'your sendgrid password'
    end

Now you can create client instances based on the api module you
want to access:

    client = Sendgrid::Web::Bounces.new
    client.get # get list of bounces
    client.delete(email: 'foobar@example.com') # delete all bounces for foobar

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Provide working specs for new features
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## License

```
The MIT License (MIT)

Copyright (c) 2013 Darren Coxall

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
