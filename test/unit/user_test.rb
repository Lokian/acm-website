require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "A User" do
    setup do
      @user = Factory(:user)
    end
  
    should_have_many :rsvps
  
    should "be attending the event" do
      event = Factory(:event)
      assert !@user.is_attending?(event)
    
      rsvp = Factory(:rsvp, :event => event, :user => @user)
      assert @user.is_attending?(event)
    end
  end
  
end
