# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "artifact_logger"
  s.summary = "A simple dropin engine for logging information on artifacts in a databse."
  s.description = "A very simple dropin engine for logging information on artifacts in a database."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"
  s.authors = ["ajrkerr"]
end
