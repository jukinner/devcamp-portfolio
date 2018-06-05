require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/portfoliopage.rb'

describe 'PortfolioPage' do
  before(:each) do
    @browser = PortfolioPage.new
    @browser.goto()
  end
  
  after(:each) do
    @browser.close_browser()
  end

  it 'goes to portfolio page' do
    expect(@browser.portfolio_identifier.displayed?).to eq(true)
  end

  it 'does not show masthead to admins' do
    @browser.login_on_portfolio()
    expect(@browser.masthead_identifier).to eq(false)
  end

  it 'shows masthead to guests' do
    expect(@browser.masthead_identifier.displayed?).to eq(true)
  end

  it 'goes to blog via button' do
    @browser.blog_button()
    expect(@browser.blog_identifier.displayed?).to eq(true)
  end

  it 'goes to about me via button' do
    @browser.about_me_button()
    expect(@browser.about_identifier.displayed?).to eq(true)
  end

  it 'logs in from portfolio page' do
    @browser.login_on_portfolio()
    @browser.open_navbar()
    expect(@browser.login_link).to eq(false)
  end

  it 'goes to show of a portfolio' do
    @browser.first_portfolio_show.click()
    expect(@browser.show_identifier.displayed?).to eq(true)
  end 

  it 'goes to all portfolios from the show page' do
    @browser.first_portfolio_show.click()
    expect(@browser.show_identifier.displayed?).to eq(true)
    @browser.all_portfolios_link()
    expect(@browser.first_portfolio_show.displayed?).to eq(true)
  end
end