require_relative 'reader'

class NightReader
  def self.read
    text_file_names = ARGV
    reader = Reader.new(text_file_names)
    reader.creation_message
    reader.read if File.file?(text_file_names[0])
  end
end

NightReader.read
