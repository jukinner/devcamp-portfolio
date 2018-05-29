require 'rails_helper'

RSpec.describe Portfolio, type: :model do 
  let(:portfolio) {Portfolio.create!(title: "A test Portfolio", body: "A test portfolio body", subtitle: "Quick portfolio test")}

  describe 'creation' do 
    before do
      @blog = blog
    end

    it 'can be created' do
      expect(@blog).to be_valid
    end
  end

  describe 'validations' do
    it 'can not be created without a body' do
      @blog.body = nil
      expect(@blog).to_not be_valid
    end
    
    it 'can not be created without a title' do
      @blog.title = nil
      expect(@blog).to_not be_valid
    end

    it 'Title must accept a string' do
      @blog.title = 123456789
      expect(@blog).to_not be_valid
    end

    it 'Title must accept a string' do
      @blog.body = 123456789
      expect(@blog).to_not be_valid
    end
  end

end