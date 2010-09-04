spec = Gem::Specification.new do |s|
  s.name = 'daemonchild'
  s.version = '0.0.1'
  s.summary = 'A stripped down and straightforward way to write daemons in Ruby.'
  s.authors = ["Jason Rohwedder"]
  s.email = 'jro@badgerhound.com'
  s.date = Time.now
  s.extra_rdoc_files = ["CHANGELOG","lib/daemonchild.rb", "LICENSE", "README"]
  s.has_rdoc = true
  s.homepage = 'http://github.com/jro/daemonchild'
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "DaemonChild", "--main", "README"]
  s.require_paths = ["lib"]
  s.test_files = ["test/test_daemonchild.rb"]
end