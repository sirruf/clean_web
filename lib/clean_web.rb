require 'clean_web/version'

module CleanWeb
  require 'net/http'

  class << self
    attr_accessor :configuration
  end

  API_URL = 'http://cleanweb-api.yandex.ru/1.0/check-spam'

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.check(text, options={})
    url = URI(API_URL)
    begin
      https = Net::HTTP.new(url.host)
      https.use_ssl = false
      params = {key: configuration.api_key}
      params = params.merge({:'body-plain' => text})
      # noinspection RubyStringKeysInHashInspection
      params = params.merge(options)
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data(params)
      puts params.inspect
      response = https.request(req)
      if response.code == '200'
        XMLParser.answer(response)
      else
        Hash({complete: false, code: response.code})
      end

    rescue => e
      {status: 'ERR', result: "Error: #{e}"}
    end


  end

  module XMLParser
    # noinspection RubyResolve
    require 'nokogiri'

    def self.answer(result)
      doc = Nokogiri::XML(result)
      check_result = doc.at('check-spam-result')
      id_tag = check_result.xpath('//id').text
      Hash({complete: true, id: id_tag, spam: check_result.at('text')['spam-flag']=='yes'})
    end
  end

  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = 'no key'
    end
  end
end
