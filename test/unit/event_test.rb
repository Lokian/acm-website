require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should_have_many :rsvps
end
