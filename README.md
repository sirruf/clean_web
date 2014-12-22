# CleanWeb

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clean_web'
```

And then execute:

    $ bundle

Install initializer 

    clean_web:install

Add API key to initializer

`config/initializers/clean_web.rb`

```ruby
CleanWeb.configure do |config|
  config.api_key = 'cw.1.1.2014...'
end
```

## Usage

`models/comment.rb`

```ruby
class Comment < ActiveRecord::Base
  before_create :check_for_spam

  private

  def check_for_spam
    result = CleanWeb.check(self.text, ip: self.ip, name: self.author, email: self.email)
    if result[:complete]
      self.spam = result[:spam]
      self.yandex_clean_web_id = result[:id]
    end
  end

end
```

## Contributing

1. Fork it ( https://github.com/sirruf/clean_web/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
