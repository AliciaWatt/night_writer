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

  it 'has attributes' do
    expect(@reader.braille_file).to eq("braille.txt")
    expect(@reader.translate_file).to eq('translate_to_english.txt')
  end
end
