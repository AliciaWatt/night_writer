require_relative 'writer'
class NightWriter
  def self.write
    text_file_names = ARGV
    # ARGV captures command line arguments in an array
    writer = Writer.new(text_file_names)
    writer.creation_message
    writer.write if File.file?(text_file_names[0])
  end
end

NightWriter.write
