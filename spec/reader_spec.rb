# require 'SimpleCov'
# SimpleCov.start

require './lib/reader'

describe Reader do
  before (:each) do
    @text_files = ['braille.txt', 'translate_to_english.txt']
    @reader = Reader.new(@text_files)
  end

  it 'exists' do
    expect(@reader).to be_a(Reader)
  end
end
