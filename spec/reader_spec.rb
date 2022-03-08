require 'SimpleCov'
SimpleCov.start

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

      expect(@reader.split_braille.length).to eq(50)
      expect(@reader.split_braille).to be_a(Array)
    end
  end

  describe 'creation_message' do
    it 'sends a message confirming creation of the new file' do
      allow(@reader).to receive(:translate_file).and_return('translate_to_english.txt')
      allow(@reader).to receive(:split_braille).and_return([1, 2, 3, 4])

      expected = "Created 'translate_to_english.txt' containing 4 characters."
      expect(@reader.creation_message).to eq(expected)
    end

    it 'sends Invalid braille file name if invalid braille file' do
      allow(@reader).to receive(:braille_file).and_return('incorrect file')

      expected = "Invalid braille file name."
      expect(@reader.creation_message).to eq(expected)
    end
  end
  describe 'translator' do
    it 'translates from braille to english' do
      expect(@reader.translator).to be_a(Array)
      expect(@reader.translator[0]).to eq('t')
    end
  end

  describe 'reader' do
    it 'reads all braille into a new text file' do
      expect(@reader.read).to eq([])
    end
  end
end
