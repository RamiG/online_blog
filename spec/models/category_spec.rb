require 'spec_helper'

describe Category do
  before { @category = Category.create(name: "Test") }

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:subcategories) }
  it { should respond_to(:parent_category) }
  it { should respond_to(:posts) }

  it { should be_valid }

  describe "subcategories" do
    before do      
      @subcat1 = Category.create(name: "Child 1", parent_id: @category.id)
      @subcat2 = Category.create(name: "Child 2", parent_id: @category.id)      
    end

    it "should include all subcategories" do
      expect(@category.subcategories.to_a).to eq [@subcat2, @subcat1]
    end

    it "should be the parent category" do
      expect(@subcat2.parent_id).to eq @category.id
    end
  end

end
