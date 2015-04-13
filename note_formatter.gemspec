Gem::Specification.new do |s|
  s.name        = 'note_formatter'
  s.version     = '0.0.0'
  s.date        = Date.today.to_s
  s.summary     = "A note formatter"
  s.description = "Formats a simple quick note txt file into a more complete one with location, duration, atendees and tasks."
  s.authors     = ["Igor Barbosa"]
  s.email       = 'igorbarbosa.p@gmail.com'
  s.files       = ["lib/note_formatter.rb"]
  s.homepage    =
    'http://rubygems.org/gems/note_formatter'
  s.license       = 'MIT'

  # ensure the gem is built out of versioned files
  s.files = Dir['{bin,lib}/**/*', 'README*', 'LICENSE*', 'configs.yml']

  s.bindir = 'bin'
  s.executables << 'note_formatter'
end
