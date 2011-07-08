Factory.define :log_message, :class => Log::Message do |m|
  m.level :info
  # m.type  "A type"
  m.text { Faker::Lorem.paragraph }
end

Factory.define :error_message, :parent => :log_message do |m|
  m.level :error
end

Factory.define :warning_message, :parent => :log_message do |m|
  m.level :warning
end