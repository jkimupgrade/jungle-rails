require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'is valid with valid attributes' do 
      @category = Category.create(name: 'Category A')
      @product = Product.create(name: 'Product A', price: 10000, quantity: 30, category: @category)
      expect(@product.errors.full_messages).to be_empty
    end

    it 'is not valid without product name' do
      @category = Category.create(name: 'Category A')
      @product = Product.create(name: nil, price: 10000, quantity: 30, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without product price' do
      @category = Category.create(name: 'Category A')
      @product = Product.create(name: 'Product A', quantity: 30, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without product quantity' do
      @category = Category.create(name: 'Category A')
      @product = Product.create(name: 'Product A', price: 10000, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without product category' do
      @category = Category.create(name: 'Category A')
      @product = Product.create(name: 'Product A', price: 10000, quantity: 30, category: nil)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
