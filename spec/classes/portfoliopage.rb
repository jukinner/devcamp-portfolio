require 'selenium-webdriver'

class PortfolioPage < BaseClass
  def initialize
    super
    @portfolios_url = 'localhost:3000/portfolios'    
  end

  def goto()
    setup(@portfolios_url)
  end
  
  def open_navbar()
    navicon.click()   
  end
  
  def login_on_portfolio()
    open_navbar()
    admin_login(true)
    goto()
  end

  def blog_button()
    find_element_with_wait(xpath: "//a[@class='btn btn-secondary'][text()='My Blog']").click()
  end
  
  def about_me_button()
    find_element_with_wait(xpath: "//a[@class='btn btn-primary']").click()
  end
  
  def all_portfolios_link()
    find_element_with_wait(xpath: "//p[@class='float-right'][a][1]").click()
  end

  def first_portfolio_show()
    find_element_with_wait(xpath: "//div[@class='card'][1]/p/span/a")
  end
  
  def show_identifier()
    find_element_with_wait(xpath: "//h3[contains(text(),'Technologies')]")
  end

  def masthead_identifier()
    find_element_with_wait(xpath: "//h1[@class='jumbotron-heading'][text()='My Portfolio']")
  end
end