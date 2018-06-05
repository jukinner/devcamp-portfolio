require 'selenium-webdriver'

class BaseClass

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('start-fullscreen')
    @driver=Selenium::WebDriver.for :chrome, options: options
    @admin_email = "jukinner@gmail.com"
    @admin_password = "12345678"
  end

  def setup(url)
    @driver.manage.window.maximize
    @driver.navigate.to url 
  end

  def write_things(element, writing)
    element.send_keys writing
  end

  def find_element_with_wait(what, time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: time) # seconds
    begin
      wait.until {
        element = @driver.find_element(what)
        element if element.displayed?
      }
    rescue Selenium::WebDriver::Error::TimeOutError
      puts "Couldn't find #{what}"
      return false
    end
  end

  def accept_alert()
    @driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
  end

  def login(email, password, using_link = false)
    login_link.click() if using_link
    
    emailfield = find_element_with_wait(xpath: '//*[@id="user_email"]', "time" => 2)
    write_things(emailfield, email)

    passwordfield = find_element_with_wait(xpath: '//*[@id="user_password"]')
    write_things(passwordfield, password)
    
    submitbutton = find_element_with_wait(xpath: "//input[@class='btn btn-primary']")
    submitbutton.click
  end

  def admin_login(using_link = false)
    login(@admin_email, @admin_password, using_link)
  end

  def logout_link()
    find_element_with_wait(link: 'Logout')
  end

  def login_link()
    find_element_with_wait(link: 'Login')
  end

  def blogs_link()
    blog = find_element_with_wait(link: 'Blog')
    blog.click
  end

  def switching_tabs()
    @driver.switch_to.window( @driver.window_handles.last )
  end

  def blog_identifier()
    find_element_with_wait(xpath: "//h1[contains(text(),'Code.Build.Learn.')][@class='blog-title']")
  end

  def portfolio_identifier()
    find_element_with_wait(xpath: "//h3[text()='Web Applications, Companies and Websites that I built personally']")
  end

  def navicon()
    find_element_with_wait(xpath: "//span[@class='navbar-toggler-icon']")
  end

  def about_identifier()
    find_element_with_wait(xpath: "//h1[text()='About Me']")
  end

  def contact_identifier()
    find_element_with_wait(xpath: "//h1[text()='Would you like to work together?']")
  end

  def get_title()
    @driver.title
  end

  def close_browser()
    @driver.quit
  end
end

