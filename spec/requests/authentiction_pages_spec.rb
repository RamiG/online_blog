require 'spec_helper'

describe "Authentication" do 

  describe "authorization" do
    describe "when user is not signed in" do
      let(:user) { User.create(email: "test@mail.com", password: "foobar123", 
                               password_confirmation: "foobar123") }

      describe "posts controller" do
        describe "when creating" do
          before { post posts_path }
          specify { expect(response).to redirect_to(new_user_session_path) }
        end
        describe "when destroying" do
          before { delete post_path(Post.create(title: "T", content: "C", user_id: user.id)) }
          specify { expect(response).to redirect_to(new_user_session_path) }
        end
      end

    end
  end

end