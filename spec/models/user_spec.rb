require 'rails_helper'

RSpec.describe User, type: :model do 
  let(:user) {FactoryBot.create(:user)}
  let(:admin_user) {User.create!(
                                email: "jukinner@gmail.com",
                                password: "12345678",
                                password_confirmation: "12345678",
                                name: "Admin User",
                                roles: "site_admin"
                              )}
  describe 'creation' do
    before do
      @user = user
      @admin_user = admin_user
    end

    it 'user can be created' do
      expect(@user).to be_valid
    end

    it 'admin user can be created' do
      expect(@admin_user).to be_valid
    end
  end  

  describe 'validations' do
    before do
      @user = user
      @admin_user = admin_user
    end

    it 'cannot be created without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'can not be created without password' do 
      expect { User.create!(
                    email: "regular@regular.com",
                    password: "",
                    password_confirmation: "",
                    name: "Regular User"
                  ) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end