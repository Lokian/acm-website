require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  should_belong_to :user
  should_belong_to :event
end
