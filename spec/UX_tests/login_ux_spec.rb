require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/login.rb'

describe "Login" do 
  before(:each) do
    @browser = Login.new()
    @browser.goto_login()
  end

  after(:each) do
    @browser.close_browser
  end

  it 'log in as an admin' do
    @browser.admin_login()
    expect(@browser.logout_link.displayed?).to eq(true)
  end
  
  it 'attempts log in with incorrect info' do
    @browser.wrong_login()
    expect(@browser.login_link.displayed?).to eq(true)
  end
end

describe 'New user Registering' do
  before(:each) do
    @browser = Login.new()
    @browser.goto_register()
  end

  after(:each) do
    @browser.close_browser()
  end

  it 'creates a new user' do
    @browser.create_correct_user()
    @browser.submit_button()
    expect(@browser.logout_link.displayed?).to eq(true)
  end

  it 'tries to create a user with too short of a password' do
    @browser.create_short_password_user()
    @browser.submit_button()
    expect(@browser.short_password_error.displayed?).to eq(true)
  end

  it 'tries to create a user with wrong password confirmation' do
    @browser.create_wrong_confirmation_user()
    @browser.submit_button()
    expect(@browser.password_confirmation_error.displayed?).to eq(true)
  end

  it 'tries to create a user with no name' do
    @browser.create_no_name_user()
    @browser.submit_button()
    expect(@browser.no_name_error.displayed?).to eq(true)
  end

  it 'tries to create a user with no email' do
    @browser.create_no_email_user()
    @browser.submit_button()
    expect(@browser.no_email_error.displayed?).to eq(true)
  end
  
end