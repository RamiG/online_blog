require 'spec_helper'

describe Post do
  before do
    @user = User.create(email: "test@mail.com", password: "foobar123", password_confirmation: "foobar123") 
    @post = Post.new(title: "Post Title", content: "Some text repeating overandover "*20, 
                     user_id: @user.id)
  end
  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:comments) }
  it { should respond_to(:tags) }
  its(:user) { should eq @user }

  it { should be_valid }

  describe "when user_id is not assigned" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "when title is empty" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "when content is empty" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

end
