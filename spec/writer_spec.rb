require './writer'

# require 'SimpleCov'
# SimpleCov.start

describe  Writer do
  before (:each) do
    text_files = ['message.txt', 'braille.txt']
    @writer = Writer.new(text_files)
  end

  it 'exists' do
    expect(@writer).to be_a(Writer)
  end

  it 'has attributes' do
    expect(@writer.text_file).to eq('message.txt')
    expect(@writer.translate_text).to eq('braille.txt')
  end

  describe '#creation_message' do
    it 'communicates creation of file and character count' do
      expect(@writer.creation_message).to include('Created')
    end
  end
end
