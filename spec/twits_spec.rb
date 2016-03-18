require 'spec_helper'

RSpec.describe Twits do
  it 'has a version number' do
    expect(Twits::VERSION).not_to be_nil
  end

  describe 'loading the env vars' do
    specify { expect(ENV['TWITS_API_KEY']).not_to be_nil }
    specify { expect(ENV['TWITS_API_SECRET']).not_to be_nil }
    specify { expect(ENV['TWITS_ACCESS_TOKEN']).not_to be_nil }
    specify { expect(ENV['TWITS_TOKEN_SECRET']).not_to be_nil }
  end
end
