module NoteFormatter
  class Note
    attr_accessor :date, :tasks

    def initialize(date)
      @date = date
      @tasks = {}
    end
  end
end
