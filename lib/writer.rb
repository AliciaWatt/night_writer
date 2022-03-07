require_relative '../lib/convert.rb'

class Writer
  attr_reader :text_file, :translate_file


  def initialize(files)
    @text_file = files[0]
    @translate_file = files[1]
    @converter = Convert.new

  end

  def split_text
    split_text = File.readlines(text_file, chomp: true).flat_map do |line|
      line.split('')
    end
  end

  def creation_message
    if File.file?(text_file)
      p "Created '#{translate_file}' containing '#{split_text.length}' characters."
    else
      p "Invalid text file name."
    end
  end

  def translator
     text_to_braille_hash = @converter.text_to_braille
    split_text.map do |letter|
      text_to_braille_hash[letter]
    end
  end
end
