require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :rsvps
end
