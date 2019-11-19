require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Adding a product to cart increases My Cart count" do
    # visit home page
    visit root_path
    # click on 'Add to Cart' button for one of the products
    first('article.product').click_on 'Add'
    
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # check the text rendered in the top nav: should change from 'My Cart (0)' to 'My Cart (1)'
    expect(page).to have_content('My Cart (1)')
  end
end
