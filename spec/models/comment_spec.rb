require 'spec_helper'

describe Comment do
  before do
    @user = User.create(email: "test@mail.com", password: "foobar123", password_confirmation: "foobar123") 
    @post = Post.create(title: "Post Title", content: "Some text repeating overandover "*20, 
                     user_id: @user.id)
    @comment = Comment.create(comment_text: "What a post!", post_id: @post.id, user_id: @user.id)
  end
  subject { @comment }

  it { should respond_to(:comment_text) }
  it { should respond_to(:post_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:post) }
  it { should respond_to(:user) }
  its(:post) { should eq @post }
  its(:user) { should eq @user }

  it { should be_valid }

  describe "when user is not assigned" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when post is not assigned" do
    before { @comment.post_id = nil }
    it { should_not be_valid }
  end

  describe "when comment text is empty" do
    before { @comment.comment_text = " " }
    it { should_not be_valid }
  end

  describe "when comment text is too long" do
    before { @comment.comment_text = "c"*513 }
    it { should_not be_valid }  
  end
end
