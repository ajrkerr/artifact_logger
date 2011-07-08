Factory.define :artifact do |a|
  a.name { Faker::Name.name }
end

Factory.define :artifact_with_message, :parent => :artifact do |a|
  a.association :log_messages, :factory => :log_message
end
