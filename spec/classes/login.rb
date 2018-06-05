require 'selenium-webdriver'
require 'faker'

class Login < BaseClass

  def initialize 
    super
    @register_url = 'localhost:3000/register'
    @login_url = 'localhost:3000/login'
    @new_login = Faker::Internet.email
    @new_password = 'asdfasdf'
    @short_password = 'asdf'
    @new_name = Faker::BackToTheFuture.character
    @wrong_email = "wrong@wrong.com"
    @wrong_password = "wrongwrongwrong"
  end

  def goto_register()
    setup(@register_url)
  end

  def goto_login()
    setup(@login_url)
  end

  def create_new_user(email, password, password_confirmation, name)
    email_field = find_element_with_wait(xpath: '//input[@id="user_email"]')
    write_things(email_field, email)

    password_field = find_element_with_wait(xpath: "//input[@id='user_password']")
    write_things(password_field, password)

    password_confirmation_field = find_element_with_wait(xpath: "//input[@id='user_password_confirmation']")
    write_things(password_confirmation_field, password_confirmation)

    name_field = find_element_with_wait(xpath: "//input[@id='user_name']")
    write_things(name_field, name)
  end

  def create_correct_user()
    create_new_user(@new_login, @new_password, @new_password, @new_name)
  end

  def create_short_password_user()
    create_new_user(@new_login, @short_password, @short_password, @new_name)
  end

  def create_no_name_user()
    create_new_user(@new_login, @new_password, @new_password, "")
  end

  def create_wrong_confirmation_user()
    create_new_user(@new_login, @new_password, @short_password, @new_name)
  end

  def create_no_email_user()
    create_new_user("", @new_password, @new_password, @new_name)
  end

  def wrong_login()
    login(@wrong_email, @wrong_password)
  end

  def submit_button()
    sign_up = find_element_with_wait(xpath: '//*[@id="new_user"]/div/div[4]/div[1]/input')
    sign_up.click()
  end

  def short_password_error()
    find_element_with_wait(xpath: "//*[@id='error_explanation']/ul/li[text()='Password is too short (minimum is 6 characters)']")
  end

  def password_confirmation_error()
    find_element_with_wait(xpath: "//*[@id='error_explanation']/ul/li[contains(text(),'Password confirmation')]")
  end

  def no_name_error()
    find_element_with_wait(xpath: "//*[@id='error_explanation']/ul/li[contains(text(),'Name') and contains(text(),'be blank')]")
  end

  def no_email_error()
    find_element_with_wait(xpath: "//*[@id='error_explanation']/ul/li[contains(text(),'Email') and contains(text(),'be blank')]")
  end
end

