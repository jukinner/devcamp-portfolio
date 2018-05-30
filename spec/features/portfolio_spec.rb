require 'rails_helper'

describe 'Porfolio Page' do
  let(:user) {User.create!(
                                email: "admin@admin.com",
                                password: "12345678",
                                password_confirmation: "12345678",
                                name: "Admin User",
                                roles: "site_admin"
                              )}
  before do
    visit root_path
    click_on "Login"
    login_as(user, :scope => :user)
    click_button 'Log in'
  end

  it 'An admin can log in' do
    expect(page).to have_content('Logout') 
  end

  it 'Portfolio can be created' do
    visit new_portfolio_path
      fill_in 'portfolio[title]', with: 'Testing Portfolio title out'
      fill_in 'portfolio[body]', with: 'Testing Portfolio Body out'
      fill_in 'portfolio[subtitle]', with: 'Testing Portfolio subtitle out'
      click_button 'Save Portfolio Item'
    expect(page).to have_content(/Web Applications/) 
  end
end