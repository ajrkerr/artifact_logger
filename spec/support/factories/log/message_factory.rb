Factory.define :message, :class => Log::Message do |m|
  m.level "Info"
  m.type  "A type"
  m.text { Faker::Lorem.paragraph }
end

Factory.define :error_message, :parent => :message do |m|
  m.level "Error"
end

Factory.define :warning_message, :parent => :message do |m|
  m.level "Warning"
end