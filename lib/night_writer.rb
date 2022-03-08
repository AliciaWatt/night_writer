require_relative 'writer'

text_file_names = ARGV
# ARGV captures command line arguments in an array

writer = Writer.new(text_file_names)
writer.creation_message
