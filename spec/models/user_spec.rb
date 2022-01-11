require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do 

    context "Should fail to create if no password present" do
      it "should fail to create when only password confirmation is present" do 
        userNoPassword = User.new(first_name: "No", last_name: 'Password', email: 'noPassword@g.com', password: nil, password_confirmation: "lhl")
        expect(userNoPassword.save).to be false 
        pp userNoPassword.errors.full_messages
      end
    end

    context 'Should fail to create if no password confirmation present' do
      it "should fail to create when only password is present" do 
        userNoPasswordConfirmation = User.new(first_name: "No", last_name: 'Password', email: 'noPassword@g.com', password: 'lhl', password_confirmation: nil)
        expect(userNoPasswordConfirmation.save).to be false
        pp userNoPasswordConfirmation.errors.full_messages
      end
    end

    it "should fail to save when password and password_confirmation is not the same" do 
      userPasswordAndConfirmationDifferent = User.new(first_name: 'Diff', last_name: "password", email: "diffPass@g.com", password: "lhl", password_confirmation: "larry")
      expect(userPasswordAndConfirmationDifferent.save).to be false 
      pp userPasswordAndConfirmationDifferent.errors.full_messages
    end

    it "should fail to save if email already exists" do 
      userEmail1 = User.new(first_name: 'Diff', last_name: "password", email: "email1@g.com", password: "lhl", password_confirmation: "lhl")
      userEmail1.save
      userEmail2 = User.new(first_name: 'Diff', last_name: "password", email: "email1@g.com", password: "lhl", password_confirmation: "lhl")
      expect(userEmail2.save).to be false
      pp userEmail2.errors.full_messages
    end

    it "should fail to save if email is the same but with different Case sensitivity" do 
       userEmail1 = User.new(first_name: 'Diff', last_name: "password", email: "email1@g.com", password: "lhl", password_confirmation: "lhl")
      userEmail1.save
      userEmail2 = User.new(first_name: 'Diff', last_name: "password", email: "Email1@g.com", password: "lhl", password_confirmation: "lhl")
      expect(userEmail2.save).to be false
      pp userEmail2.errors.full_messages
    end

    it "should fail to save if firts_name is not present" do 
      userNoFirstName = User.new(first_name: nil, last_name: "password", email: "email1@g.com", password: "lhl", password_confirmation: "lhl")
      expect(userNoFirstName.save).to be false
      pp userNoFirstName.errors.full_messages
    end
   
    it "should fail to save if firts_name is not present" do 
      userNoLastName = User.new(first_name: "No Last name", last_name: nil, email: "email1@g.com", password: "lhl", password_confirmation: "lhl")
      expect(userNoLastName.save).to be false
      pp userNoLastName.errors.full_messages
    end

    it "should fail to save if Password smaller than 3 characters" do 
      userPasswordShort = User.new(first_name: "No Last name", last_name: nil, email: "email1@g.com", password: "lh", password_confirmation: "lh")
      expect(userPasswordShort.save).to be false
      pp userPasswordShort.errors.full_messages
    end

    it "should authenticate user if password is correct" do
      userPasswordAuth = User.new(first_name: "No Last name", last_name: 'last', email: "email1@g.com", password: "lhl1", password_confirmation: "lhl1")
      userPasswordAuth.save 
      expect(User.authenticate_with_credentials("email1@g.com", "lhl1")).to eq(userPasswordAuth)
    end
    
    it "should authenticate with spaces in the email" do
      userPasswordAuth = User.new(first_name: "No Last name", last_name: 'last', email: "email1@g.com", password: "lhl1", password_confirmation: "lhl1")
      userPasswordAuth.save 
      expect(User.authenticate_with_credentials(" email1@g.com ", "lhl1")).to eq(userPasswordAuth)
    end


    it "should login even if users have different cases in their email" do
      userPasswordAuth = User.new(first_name: "No Last name", last_name: 'last', email: "email1@g.com", password: "lhl1", password_confirmation: "lhl1")
      userPasswordAuth.save 
      expect(User.authenticate_with_credentials(" eMail1@g.Com ", "lhl1")).to eq(userPasswordAuth)
    end
  end
end


