require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
  
    it 'is valid with valid attributes' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123')
      expect(@user.errors.full_messages).to be_empty
    end
    
    it 'is not valid without matching passwords' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: 'abc123', password_confirmation: 'bbc125')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without password' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: 'test@test.com', password: nil, password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it 'is not valid without first name' do 
      @user = User.create(first_name: nil, last_name: 'Kim', 
        email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123')
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without last name' do 
      @user = User.create(first_name: 'Jim', last_name: nil, 
        email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123')
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid without email' do 
      @user = User.create(first_name: 'Jim', last_name: 'Kim', 
        email: nil, password: 'abc123', password_confirmation: 'abc123')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid with existing email (not case sensitive)' do 
      @user1 = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123')
      @user2 = User.create(first_name: 'Jim', last_name: 'Kim',
        email: 'TEST@TEST.com', password: 'abc123', password_confirmation: 'abc123')
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

  end

end
