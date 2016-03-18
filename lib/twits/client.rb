require 'oauth'
require 'pp'

module Twits
  class Client
    attr_reader :consumer, :access_token, :base_url
    def initialize
      @consumer = OAuth::Consumer.new(ENV['TWITS_API_KEY'],
                                      ENV['TWITS_API_SECRET'],
                                      :site => 'https://api.twitter.com',
                                      :scheme => :header)
      setup_oauth
      setup_address
    end

    def run
      require 'pry'; binding.pry
      response = access_token.request(:get, addr_string)
      require 'pry'; binding.pry
      puts "Got Response:\n#{response.inspect}"
      puts "\n\n", '=' * 80
      pp response
    end

    def prepare_access_token(oauth_token, oauth_token_secret)
      token_hash = {
        oauth_token: oauth_token,
        oauth_token_secret: oauth_token_secret
      }
      tok = OAuth::AccessToken.from_hash(@consumer, token_hash)
      return tok
    end

    private
    attr_reader :addr_string, :http

    def setup_oauth
      tok_hash = {
        oauth_token: ENV['TWITS_ACCESS_TOKEN'],
        oauth_token_secret: ENV['TWITS_TOKEN_SECRET']
      }
      @access_token = OAuth::AccessToken.from_hash(@consumer, tok_hash)
    end

    # def setup_oauth_# {{{
    #   @consumer_key = OAuth::Consumer.new(@api_key,
    #                                       @api_secret,
    #                                       site: @base_url,
    #                                       scheme: :header)

    #   puts "Consumer Key: #{@consumer_key.inspect}"

    #   @access_token = OAuth::AccessToken.from_hash(@consumer_key, token_hash)
    #   puts "Access Token: #{@access_token.inspect}"
    # end# }}}

    def setup_address# {{{
      @base_url = 'https://api.twitter.com'
      @addr_string = "#{@base_url}/1.1/account/verify_credentials.json"
      @address = URI(@addr_string)
    end# }}}

    def setup_http# {{{
      @http = Net::HTTP.new(address.host, address.port).tap do |httparty|
        httparty.use_ssl = true
        httparty.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end# }}}

    def build_request
      request = Net::HTTP::Get.new(address.request_uri)
      request.oauth! http, consumer_key, access_token
      request
    end
  end
end
