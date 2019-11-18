require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'is valid with valid attributes' do 
      @user = User.new(password: 'abc123', password_confirmation: 'abc123')
      expect(@user).to be_valid
    end
    
    it 'is not valid without matching passwords' do 
      @user = User.new(password: 'abc123', password_confirmation: 'bbc125')
      expect(@user).to_not be_valid
    end

    it 'is not valid without password' do 
      @user = User.new(password: nil, password_confirmation: nil)
      expect(@user).to_not be_valid
    end


  end

end
