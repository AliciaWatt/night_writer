class Writer
  attr_reader :text_file, :translate_file

  def initialize(files)
    @text_file = files[0]
    @translate_file = files[1]
  end

  def split_text
    split_text = File.readlines(text_file, chomp: true).flat_map do |line|
      line.split('')
    end
  end

  def creation_message
    p "Created '#{translate_file}' containing '#{split_text.length}' characters."
  end
end
