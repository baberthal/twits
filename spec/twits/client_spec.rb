require 'spec_helper'

module Twits
  RSpec.describe Client do
    let(:client) { described_class.new }
    let(:exp_api_key) { ENV['TWITS_API_KEY'] }
    let(:exp_api_secret) { ENV['TWITS_API_SECRET'] }
    let(:exp_tok) { ENV['TWITS_ACCESS_TOKEN'] }
    let(:exp_tok_secret) { ENV['TWITS_TOKEN_SECRET'] }

    describe 'initialization' do
      it 'has an api key' do
        k = client.instance_variable_get(:@api_key)
        expect(k).to eq exp_api_key
        expect(k).to_not be_nil
      end

      it 'has an api secret' do
        k = client.instance_variable_get(:@api_secret)
        expect(k).to eq exp_api_secret
        expect(k).to_not be_nil
      end

      it 'has an access token' do
        k = client.instance_variable_get(:@access_tok)
        expect(k).to eq exp_tok
        expect(k).to_not be_nil
      end

      it 'has a token secret' do
        k = client.instance_variable_get(:@token_secret)
        expect(k).to eq exp_tok_secret
        expect(k).to_not be_nil
      end
    end

    describe 'oath' do
      it 'has a consumer key oauth object' do
        expect(client.consumer_key).to be_an OAuth::Consumer
      end

      it 'has an access token oauth object' do
        expect(client.access_token).to be_an OAuth::Token
      end
    end
  end
end
