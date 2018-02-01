module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user #if their is no user logged in, go to the open struct "guest user". otherwise the devise gem stays on the lft side of method. 
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end