require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # create user
  before :each do
    User.create!(first_name: 'test', last_name: 'test', 
    email: 'test@test', password: 'test1234', password_confirmation: 'test1234')
  end
  
  scenario "They see all products" do
    # visit login page
    visit login_path
    # fill in username
    fill_in 'email', with: 'test@test'
    # fill in password
    fill_in 'password', with: 'test1234'
    # submit login credentials
    click_on 'Submit'
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    # check if 'Signed in as:' appears in the nav bar
    expect(page).to have_content('Signed in as: test')
  end
  
end
