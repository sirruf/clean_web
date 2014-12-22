# CleanWeb

Simple Yandex Clean Web client for Rails

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clean_web', git: 'https://github.com/sirruf/clean_web.git'
```

And then execute:

    $ bundle

Install initializer 

    clean_web:install
Get Yandex Clean Web API key [here](https://tech.yandex.ru/cleanweb/).
Add key to initializer. 

`config/initializers/clean_web.rb`

```ruby
CleanWeb.configure do |config|
  config.api_key = 'cw.1.1.2014...'
end
```

## Usage

Simple usage:

```ruby
CleanWeb.check(text: 'Test comment', ip: '192.168.1.0') # => {:complete=>true, :id=>"##-XXXXX[]", :spam=>false, :code=>"200"}

```

Check comments: 

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
