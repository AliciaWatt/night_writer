require_relative 'convert'

class Reader
  attr_reader :braille_file, :translate_file, :converter

  def initialize(files)
    @braille_file = files[0]
    @translate_file = files[1]
    @converter = Convert.new
  end
end
