describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { User.create(email: "test@mail.com", password: "foobar123", 
      password_confirmation: "foobar123") }
    let!(:post1) { Post.create(title: "First", content: "Some text...", user: user) }
    let!(:post2) { Post.create(title: "Second", content: "Some other content...", user: user) }

    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }
    describe "posts" do
      it { should have_content(post1.title) }
      it { should have_content(post1.content) }
      it { should have_content(post2.title) }     
      it { should have_content(post2.content) }
      it { should have_content(user.posts.count) }
    end
  end 

  # describe signup, signin
end