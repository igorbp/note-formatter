require_relative 'configuration'

class Formatter
  include ConfigurationHelper
  attr_accessor :format, :note

  def initialize(format, note)
    @format = format
    @note = note
  end

  def format_file
    file = File.new("./atas/#{note.date}.txt", "w")
    header file
    body file
    file.close
  end

  private

    def header(file)
      file.puts("#{l 'date_time'} #{note.date} #{f 'time', format}\n\n")
      file.puts("#{l 'location'} #{f 'location', format}\n\n")
      file.puts("#{l 'duration'} #{f 'duration', format}\n\n")
      file.puts("#{l 'attendees'} #{f 'attendees', format}\n\n\n")
    end

    def body(file)
      file.puts("#{l 'tasks'}\n\n")
      note.tasks.each { |key, value| file.puts("#{m value} #{key}") }
    end
end
