require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see product details" do
    # visit products page
    visit root_path
    # click on one of the product partials in order to navigate directly to a product detail
    first('h4').click

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    expect(current_path).to eq('/products/10')
    expect(page).to have_css 'article.product-detail', count: 1
  end

end