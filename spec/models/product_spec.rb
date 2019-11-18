require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'is valid with valid attributes' do 
      @category = Category.new(name: 'Category A')
      @product = Product.new(name: 'Product A', price: 10000, quantity: 30, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without product name' do
      @category = Category.new(name: 'Category A')
      @product = Product.new(name: nil, price: 10000, quantity: 30, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is not valid without product price' do
      @category = Category.new(name: 'Category A')
      @product = Product.new(name: 'Product A', quantity: 30, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is not valid without product quantity' do
      @category = Category.new(name: 'Category A')
      @product = Product.new(name: 'Product A', price: 10000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is not valid without product category' do
      @category = Category.new(name: 'Category A')
      @product = Product.new(name: 'Product A', price: 10000, quantity: 30, category: nil)
      expect(@product).to_not be_valid
    end

  end
end
