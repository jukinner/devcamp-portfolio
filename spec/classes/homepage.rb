require 'selenium-webdriver'

class HomePage < BaseClass

  def initialize
    super
    @homepage_url = "localhost:3000"
  end

  def goto()
    setup(@homepage_url)
  end
  
  def about_me_link()
    about_me = find_element_with_wait(xpath: "//a[@href='/about'][text()='About Me'][text()='About Me'][@class='nav-link']")
    about_me.click    
  end

  def about_me_button()
    about_button = find_element_with_wait(xpath: "//a[@class='btn btn-lg btn-primary'][text()='About Me']")
    about_button.click
  end

  def contact_link()
    contact = find_element_with_wait(link: 'Contact')
    contact.click
  end

  def welcome_message()
    find_element_with_wait(xpath: "//*[text()='Welcome to my Portfolio.']")
  end
end