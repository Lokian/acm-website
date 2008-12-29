require 'factory_girl'

Factory.define :user do |f|
  f.email 'jdoe@uci.edu'
  f.username 'username'
  f.name 'John Doe'
  f.password 'qwerty'
  f.password_confirmation 'qwerty'
end

Factory.define :event do |f|
  f.name 'test event 1'
  f.description 'Description for test event 1.'
  f.start_time { Time.now }
  f.end_time { Time.now + 1.hour }
end

Factory.define :rsvp do |f|
  f.association :event, :factory => :event
  f.association :user,  :factory => :user
end