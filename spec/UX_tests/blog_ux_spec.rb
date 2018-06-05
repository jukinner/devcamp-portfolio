require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/blog.rb'

describe 'Blog Page' do
  before(:each) do
    @browser = BlogPage.new()
    @browser.goto()
  end
  
  after(:each) do
    @browser.close_browser()
  end

  it 'goes to the blogs page' do
   expect(@browser.blog_identifier.displayed?).to eq(true)
  end

  it 'makes sure users must be signed in to write new blogs' do
    expect(@browser.new_blog_link).to eq(false)
  end

  it 'logs in from blogs page and navigates back to blogs' do
    @browser.blogs_login()
    expect(@browser.blog_identifier.displayed?).to eq(true)
    expect(@browser.login_link).to eq(false)
  end

  xit 'writes a new blog' do
    @browser.blogs_login()
    @browser.new_blog_link.click()
    @browser.write_new_blog()
    expect(@browser.new_blog_identifier.displayed?).to eq(true)
    @browser.delete_blog_on_show()
    sleep 1
  end

  xit 'tries to write a blog without a title' do
    @browser.blogs_login()
    @browser.new_blog_link.click()
    @browser.write_blog_body('Type something here to test out a body')
    @browser.submit_blog()
    expect(@browser.missing_info_error.displayed?).to eq(true)
  end

  xit 'tries to write a blog without a body' do
    @browser.blogs_login()
    @browser.new_blog_link.click()
    @browser.write_blog_title('A title would go here')
    @browser.submit_blog()
    expect(@browser.missing_info_error.displayed?).to eq(true)
  end

  it 'navigates to github' do
    @browser.github_link()
    @browser.switching_tabs()
    expect(@browser.get_title).to include("jukinner")
  end
end