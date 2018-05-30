require 'rails_helper'

RSpec.describe Blog, type: :model do 
  let(:topic){Topic.create!(title: "A test topic")}
  let(:blog){Blog.create!(title: "A great test blog for rspec", body: "lorem ipsum test test test", topic_id: 1)}
  
  describe 'creation' do
    before(:example) do
      Topic.create!(title: "A test topic")
      blog = Blog.create!(title: "A great test blog for rspec", body: "lorem ipsum test test test", topic_id: 1)
      @blog = blog
    end

    it 'a blog can be created' do
      expect(@blog).to be_valid
    end
  end

  # describe 'validations' do
  #   before do
  #     Topic.create!(title: "A test topic")
  #     blog = Blog.create!(title: "A great test blog for rspec", body: "lorem ipsum test test test", topic_id: 1)
      
  #     @blog = blog
  #   end

  #   it 'cannot be created without a title' do
  #     @blog.title = nil
  #     expect(@blog).to_not be_valid
  #   end
  # end
end
