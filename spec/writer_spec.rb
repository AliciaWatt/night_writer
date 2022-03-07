require './lib/writer'

# require 'SimpleCov'
# SimpleCov.start

describe Writer do
  before (:each) do
    text_files = ['message.txt', 'braille.txt']
    @writer = Writer.new(text_files)
  end

  it 'exists' do
    expect(@writer).to be_a(Writer)
  end

  it 'has attributes' do
    expect(@writer.text_file).to eq('message.txt')
    expect(@writer.translate_file).to eq('braille.txt')
  end

  describe 'split_text' do
    it 'splits text into an array' do
      expect(@writer.split_text.length).to eq(11)
      expect(@writer.split_text).to be_a(Array)
    end
  end

  describe '#creation_message' do
    it 'communicates creation of file and character count' do
      expect(@writer.creation_message).to include('Created')
    end
  end
end
