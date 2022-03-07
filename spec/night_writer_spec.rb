require './lib/night_writer'

# require 'simplecov'
# SimpleCov.start

describe NightWriter do
  before(:each) do
    @writer = NightWriter.new
  end

  it 'is an instance of NightWriter' do
    expect(@writer).to be_a(NightWriter)
  end
end
