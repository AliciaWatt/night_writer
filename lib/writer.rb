require_relative 'convert'

class Writer
  attr_reader :text_file, :translate_file, :converter

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
      p "Created '#{translate_file}' containing #{split_text.length} characters."
    else
      p "Invalid text file name."
    end
  end

  def translator
    text_to_braille_hash = converter.text_to_braille
    split_text.map do |letter|
      text_to_braille_hash[letter]
    end
  end

  def write
    letters = translator
    File.open(translate_file, 'w') do |file|
      # until letters == []
      letters.each do |letter|
        file.write "#{letter[0]}#{letter[1]}"
      end
      file.write "\n"
      letters.each do |letter|
        file.write "#{letter[2]}#{letter[3]}"
      end
      file.write "\n"
      letters.each do |letter|
        file.write "#{letter[4]}#{letter[5]}"
      end
      file.write "\n"
    end
    letters
  end

  # def write
  #   letters = translator
  #   until letters == []
  #     first_elements = letters.shift(20)
  #     first_two_dots(first_elements)
  #     middle_two_dots(first_elements)
  #     last_two_dots(first_elements)
  #   end
  #   letters
  # end
  #
  # def first_two_dots(elements)
  #   File.open(translate_file, 'a') do |file|
  #     elements.each do |array|
  #       file.write "#{array[0]}#{array[1]}"
  #     end
  #     file.write "\n"
  #   end
  # end
  #
  # def middle_two_dots(elements)
  #   File.open(translate_file, 'a') do |file|
  #     elements.each do |array|
  #       file.write "#{array[2]}#{array[3]}"
  #     end
  #     file.write "\n"
  #   end
  # end
  #
  # def last_two_dots(elements)
  #   File.open(translate_file, 'a') do |file|
  #     elements.each do |array|
  #       file.write "#{array[4]}#{array[5]}"
  #     end
  #     file.write "\n"
  #   end
  # end
end
