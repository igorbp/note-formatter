#encoding: utf-8
require 'date'
require_relative 'formatter'
require_relative  'note'

module NoteFormatter

  f = File.open("notas.txt", "r")

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
