require 'rails_helper'

RSpec.describe User, type: :model do 
  # let(:@user) {User.create!(
  #                         email: "regular@regular.com",
  #                         password: "asdfasdf",
  #                         password_confirmation: "asdfasdf",
  #                         name: "Regular User"
  #                       )}
  # let(:@admin_user) {User.create!(
  #                               email: "jukinner@gmail.com",
  #                               password: "12345678",
  #                               password_confirmation: "12345678",
  #                               name: "Admin User",
  #                               roles: "site_admin"
  #                             )}
  describe 'creation' do
    it 'user can be created' do
      @user = User.create!(
                          email: "regular@regular.com",
                          password: "asdfasdf",
                          password_confirmation: "asdfasdf",
                          name: "Regular User"
                        )
      expect(@user).to be_valid
    end

    it 'admin user can be created' do
      @admin_user = User.create!(
                                email: "jukinner@gmail.com",
                                password: "12345678",
                                password_confirmation: "12345678",
                                name: "Admin User",
                                roles: "site_admin"
                              )
      expect(@admin_user).to be_valid
    end
  end  

  describe 'validations' do
    it 'cannot be created without a name' do
      @user = User.create!(
                    email: "regular@regular.com",
                    password: "asdfasdf",
                    password_confirmation: "asdfasdf",
                    name: "Regular User"
                  )
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'can not be created without password' do 
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_no be_valid
    end
  end
end