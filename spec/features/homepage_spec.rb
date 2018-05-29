require 'rails_helper'

describe 'Homepage' do
  before do
    visit root_path
  end

  it 'login button is present' do 

    expect(page).to have_content(/Login/)
  end

  it 'Login button can be clicked on' do

    click_on "Login"

    expect(page).to have_content(/Forgot your password?/)
  end
end

describe 'Navigation' do
  let(:user) {User.create(
                email: "regular@regular.com",
                password: "asdfasdf",
                password_confirmation: "asdfasdf",
                name: "Regular User"
                )}

  before do 
    visit root_path
  end

  # before :each do
  #   user = User.create(
  #               email: "regular@regular.com",
  #               password: "asdfasdf",
  #               password_confirmation: "asdfasdf",
  #               name: "Regular User"
  #               )
  # end

  it 'Navigation bar changes once someone is logged in' do
    click_on "Login"
    login_as(user, :scope => :user)
    click_button 'Log in'
    expect(page).to have_content('Logout') 
  end
end
