class User < ActiveRecord::Base
  # email regex that only matches @uci.edu or @ics.uci.edu email addresses
  uci_email_field_regex = /\A[\w\.%\+\-]+@(?:ics\.)?uci\.edu\z/i
  
  acts_as_authentic :login_field => :email, 
                    :login_field_validates_format_of_options => 
                      {
                        :with     => uci_email_field_regex,
                        :message  => "has to be a @uci.edu or @ics.uci.edu address."
                        # in the future consider only making the uci email required for
                        # when they can sign up. Then allow them to change afterward
                      }
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
