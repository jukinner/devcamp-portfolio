require 'selenium-webdriver'

class BlogPage < BaseClass
  def initialize
    super
    @blogs_url = "localhost:3000/blogs"
  end

  def goto()
    setup(@blogs_url)
  end

  def new_blog_link()
    find_element_with_wait(xpath: "//a[@href='/blogs/new']")
  end

  def write_blog_title(text)
    title = find_element_with_wait(xpath: '//*[@id="blog_title"]' )
    type_things_out( title, text )
  end

  def write_blog_body(text)
    body = find_element_with_wait(xpath: '//*[@id="blog_body"]', 'time' => 3 )
    type_things_out( body, text )
  end

  def submit_blog()
    submit = find_element_with_wait(xpath: '//*[@id="new_blog"]/div[3]/input', 'time' => 3 )
    submit.click()
  end

  def pick_topic
    find_element_with_wait(xpath: "//select[@class='form-control']//option[@value='2']").click()
  end

  def write_new_blog()
    write_blog_title("A Title")
    write_blog_body("This is a body")
    pick_topic
    submit_blog()
  end

  def missing_info_error()
    find_element_with_wait(xpath: '//*[@id="error_explanation"]/ul/li', 'time' => 3 )
  end

  def github_link()
    find_element_with_wait(xpath: "//*[@class='fa fa-github']", 'time' => 3 ).click()
  end

  def blogs_login()
    admin_login(true)
    goto()    
  end

  def delete_blog_on_show()
    delete = find_element_with_wait(xpath: "//a[text()='Delete']")
    delete.click
    accept_alert()
  end
end