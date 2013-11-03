require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have content 'Online Blog'" do
      visit root_path
      expect(page).to have_content('Online Blog')
    end
    it "should have title 'Home'" do
      visit root_path
      expect(page).to have_title('Online Blog')
    end
  end

  describe "About page" do
    it "should have content 'Online Blog'" do
      visit '/about'
      expect(page).to have_content('About')
    end
    it "should have title 'About'" do
      visit '/about'
      expect(page).to have_title('Online Blog | About')
    end
  end

end
