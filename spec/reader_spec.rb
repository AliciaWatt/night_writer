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

  describe 'split_braille' do
    it 'splits braille into an array' do
      allow(@reader).to receive(:braille_file).and_return('braille.txt')

      expect(@reader.split_braille.length).to eq(49)
      expect(@reader.split_braille).to be_a(Array)
    end
  end
end
