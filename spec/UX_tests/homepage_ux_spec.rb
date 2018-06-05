require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/homepage.rb'

describe 'HomePage' do
  before(:each) do
    @browser = HomePage.new()
    @browser.goto()
  end

  after(:each) do
    @browser.close_browser()
  end

  it 'Goes to the homepage' do
    sleep 1
    expect(@browser.welcome_message.displayed?).to eq(true)
  end

  # it 'navigates to about me page via nav bar' do
  #   @browser.about_me_link()
  #   expect(@browser.about_identifier.displayed?).to eq(true)
  # end

  it 'navigates to about me page via button' do
    @browser.about_me_button()
    expect(@browser.about_identifier.displayed?).to eq(true)
  end

  it 'navigate to contact page' do
    @browser.contact_link()
    expect(@browser.contact_identifier.displayed?).to eq(true)
  end
end
