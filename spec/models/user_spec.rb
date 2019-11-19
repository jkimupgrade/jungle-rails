require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
  
    it 'is valid with valid attributes' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      
      expect(@user.errors.full_messages).to be_empty
    end
    
    it 'is not valid without matching passwords' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'bbcd1245')
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without password' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: nil, password_confirmation: nil)
      
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it 'is not valid without first name' do 
      @user = User.create(first_name: nil, last_name: 'Kim', 
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without last name' do 
      @user = User.create(first_name: 'Jim', last_name: nil, 
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid without email' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: nil, password: 'abcd1234', password_confirmation: 'abcd1234')
      
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid with existing email (not case sensitive)' do 
      @user1 = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      @user2 = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'TEST@TEST.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid with password shorter than 8 characters' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: 'a', password_confirmation: 'a')
      
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it 'successful authentication with valid credentials' do
      @user = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      @session = @user.authenticate_with_credentials('test@test.com', 'abcd1234')
      
      expect(@session).to eq @user
    end

    it 'unsuccessful authentication with incorrect password' do
      @user = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      @session = @user.authenticate_with_credentials('test@test.com', 'abcd1236')
      
      expect(@session).to eq nil
    end

    it 'successful authentication with valid credentials with spaces' do
      @user = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'test@test.com', password: 'abcd1234', password_confirmation: 'abcd1234')
      @session = @user.authenticate_with_credentials('  test@test.com  ', 'abcd1234')
      
      expect(@session).to eq @user
    end
  end

end
