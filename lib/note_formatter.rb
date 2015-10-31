#encoding: utf-8
require 'date'
require 'note_formatter/formatter'
require 'note_formatter/note'

module NoteFormatter

  def self.test(options)

    f = File.open(options[:note_path], "r")

    a = f.readlines

    notes = []
    note = nil

    a.each do |line|
      if line[0] == "!"
        notes << note if note
        note = Note.new line.gsub(/[!\n]/,"")
      elsif (line[0] =~ /[*>]/) && note
        task = ({ line.gsub(/[*>\n]/,"") => line[0] })
        note.tasks.merge!(task)
      elsif (line[0] == "$")
        notes << note if note
      end
    end

    notes.each { |n| Formatter.new("ata_tcc", n).format_file }
  end
end
