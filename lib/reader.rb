require_relative 'convert'

class Reader
  attr_reader :braille_file, :translate_file, :converter

  def initialize(files)
    @braille_file = files[0]
    @translate_file = files[1]
    @converter = Convert.new
  end

  def split_braille
    braille_by_char = []
    braille_by_lines.each do |line|
      split_line = line.split('')
      num = 0
      until (split_line == [])
        braille_by_char[num.floor] ||= []
        braille_by_char[num.floor] << split_line.shift
        num += 0.5
      end
    end
    braille_by_char
  end

  def braille_by_lines
    braille_by_lines = ['', '', '']
    split_braille = File.readlines(braille_file, chomp: true)
    until split_braille == []
      braille_by_lines[0] << split_braille.shift
      braille_by_lines[1] << split_braille.shift
      braille_by_lines[2] << split_braille.shift
    end
    braille_by_lines
  end

  def creation_message
    if File.file?(braille_file)
      p "Created '#{translate_file}' containing #{split_braille.length} characters."
    else
      p "Invalid braille file name."
    end
  end

  def translator
    braille_to_text_hash = converter.braille_to_text
    split_braille.map do |character|
      braille_to_text_hash[character]
    end
  end

  def read
    characters = translator
    File.open(translate_file, 'w')do |file|
    until characters = []
      file.write "#{characters.shift}"
    end
  end
  characters
end
end
