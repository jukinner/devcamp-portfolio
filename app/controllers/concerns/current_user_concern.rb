module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user #if their is no user logged in, go to the open struct "guest user". otherwise the devise gem stays on the lft side of method. 
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User", 
                   first_name: "Guest", 
                   last_name: "User", 
                   email: "guest@example.com")
  end
end