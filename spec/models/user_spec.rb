require 'spec_helper'

describe User do
  before { @user = User.new(email: "test@mail.com", password: "foobar123",
                            password_confirmation: "foobar123")}
  subject{ @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }  
  it { should respond_to(:admin?) }  

  it { should be_valid }

  describe "when e-mail is not assigned" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when e-mail format is valid" do
    it "should be valid" do
      emails = %w[test@MAIL.Com test+1@mail.org te-st@mail.co.uk test.mail@mail.us.com]
      emails.each do |email|
        @user.email = email
        expect(@user).to be_valid
      end
    end
  end

  describe "when e-mail format is invalid" do
    it "should be invalid" do
      emails = %w[test@mail,com test_at_mail.com test.test@mail.mail@mail.mail.com]
      emails.each do |email|
        @user.email = email
        expect(@user).not_to be_valid
      end
    end
  end

  describe "e-mail uniquness" do
    before do
      other_user = @user.dup
      other_user.email = @user.email.upcase
      other_user.save
    end
    it { should_not be_valid }
  end

  describe "when password is empty" do
    before do
      @user = User.new(email: "test@mail.org", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "something_else" }
    it { should_not be_valid }
  end  

  describe "first registered must be admin" do
    before { @user.save }
    it { should be_admin }
  end

end
