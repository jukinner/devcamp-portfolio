require 'rails_helper'

describe 'Blog Page' do
  let(:user) {User.create!(
                                email: "admin@admin.com",
                                password: "12345678",
                                password_confirmation: "12345678",
                                name: "Admin User",
                                roles: "site_admin"
                              )}

  before do
    visit root_path
    click_on "Login"
    login_as(user, :scope => :user)
    click_button 'Log in'
  end

  it 'An admin can log in' do
    expect(page).to have_content('Logout') 
  end

  it 'Blog can be created' do
    visit new_blog_path
      fill_in 'blog[title]', with: 'Testing title out'
      fill_in 'blog[body]', with: 'Testing Body out'
      # select "API", from: "blog_topic_id"
      # find('#blog_topic_id').click
      # find(:xpath, "/html/body/div[@class='container']/div[@class='row']/div[@class='col-sm-8 blog-main']/form[@id='new_blog']/div[@class='form-group'][2]/select[@id='blog_topic_id']").click
      # find(:css, '#blog_topic_id').click_on(text => "Rails Development")

      # find(:xpath, "//*[@id='blog_topic_id']/option[2]").select_option
      # click_button 'Submit'
    expect(page).to have_content(/New Blog/) 
  end
end

