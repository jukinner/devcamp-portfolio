require 'rails_helper'

RSpec.describe Portfolio, type: :model do 
  let(:portfolio) {Portfolio.create!(title: "A test Portfolio", body: "A test portfolio body", subtitle: "Quick portfolio test")}

  describe 'creation' do 
    before do
      @portfolio = portfolio
    end

    it 'can be created' do
      expect(@portfolio).to be_valid
    end
  end

  describe 'validations' do
    before do
      @portfolio = portfolio
    end

    it 'can not be created without a body' do
      @portfolio.body = nil
      expect(@portfolio).to_not be_valid
    end
    
    it 'can not be created without a title' do
      @portfolio.title = nil
      expect(@portfolio).to_not be_valid
    end
  end
end