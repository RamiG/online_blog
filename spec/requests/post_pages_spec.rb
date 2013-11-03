require 'spec_helper'

describe "Post pages" do 
  subject { page }
  
  before (:each) do
    @user = User.create(email: "test@mail.com", password: "foobar123", password_confirmation: "foobar123")    
    sign_in_as @user
  end

  describe "create a post" do
    before { visit new_post_path }

    describe "with empty contents" do
      it "post button should be disabled" do        
        find_button('submit_button', disabled: true)[:disabled].should eq "disabled"
      end
    end

    describe "with valid information" do
      before do
        fill_in 'title_field', with: "title"
        fill_in 'content_field', with: "some text"
      end
      it "should create a post" do
        expect { click_button("submit_button", disabled: true) }.to change(Post, :count).by(1)        
      end
    end
  end

  # describe "edit post" do

  # describe "delete post " do
  
  # describe "add comment"

  # describe "delete comment"

  # describe "when user is not signed in can't edit post, post comments"
end