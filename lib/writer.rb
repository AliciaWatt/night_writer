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

  def write
    letters = translator
    until letters == []
      first_elements = letters.shift(20)
      first_two_dots(first_elements)
      middle_two_dots(first_elements)
      last_two_dots(first_elements)
    end
    letters
  end

  def first_two_dots(elements)
    File.open(translate_file, 'a') do |file|
      elements.each do |array|
        if array.length == 6
          file.write "#{array[0]}#{array[1]}"
        else
          file.write "#{array[0]}#{array[1]}#{array[2]}#{array[3]}"
        end
      end
      file.write "\n"
    end
  end

  def middle_two_dots(elements)
    File.open(translate_file, 'a') do |file|
      elements.each do |array|
        if array.length == 6
          file.write "#{array[2]}#{array[3]}"
        else
          file.write "#{array[4]}#{array[5]}#{array[6]}#{array[7]}"
        end
      end
      file.write "\n"
    end
  end

  def last_two_dots(elements)
    File.open(translate_file, 'a') do |file|
      elements.each do |array|
        if array.length == 6
          file.write "#{array[4]}#{array[5]}"
        else
          file.write "#{array[8]}#{array[9]}#{array[10]}#{array[11]}"
        end
      end
      file.write "\n"
    end
  end
end
