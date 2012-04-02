# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "artifact_logger"
  s.summary = "A simple dropin engine for logging information on artifacts in a databse."
  s.description = "A very simple dropin engine for logging information on artifacts in a database."
  s.files = Dir["lib/**/*", 'app/**/*', 'db/**/*'] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "1.2.0"
  s.authors = ["Adam T Kerr"]
  s.email = "artifact_logger.rubygems@adamkerr.net"
  s.homepage = "http://github.com/ajrkerr/artifact_logger/"
end
