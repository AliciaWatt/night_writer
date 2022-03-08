require './lib/convert'

describe Convert do
  before (:each) do
    @converter = Convert.new
  end

  it 'is an instance of a Converter' do
    expect(@converter).to be_a(Convert)
  end

  describe 'text_to_braille' do
    it "returns a hash with letters assigned to braille" do
      expect(@converter.text_to_braille.length).to eq(53)
      expect(@converter.text_to_braille).to be_a(Hash)
    end
  end

  describe 'splitter' do
    it 'creates an array out of the given input' do
      expect(@converter.splitter("./lib/braille_alphabet.txt").length).to eq(53)
      expect(@converter.splitter("./lib/braille_alphabet.txt")).to be_a(Array)
    end
  end
end

# require 'pry'; binding.pry
