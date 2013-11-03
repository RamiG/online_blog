require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { User.create(email: "test@mail.com", password: "foobar123", 
      password_confirmation: "foobar123") }
    
    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }    
  end 

  # describe signup, signin
end