require 'spec_helper'
describe Api::ProblemsController do

 context 'show all' do
    describe 'GET #index' do
      before do
        category = FactoryGirl.create(:category)
        problem1 = FactoryGirl.create(:problem, subcategory_id: category.subcategories.first.id.to_s)
        problem2 = FactoryGirl.create(:problem, subcategory_id: category.subcategories.first.id.to_s)

        get :index, category_id: category.id.to_s, subcategory_id: category.subcategories.first.id.to_s
      end
      let(:body) { JSON.parse(response.body)}
      it "returns http 200" do
        response.response_code.should == 200
      end

    end
  end


 context 'show one' do
    describe 'GET #show' do
      before do
        category = FactoryGirl.create(:category)
        problem1 = FactoryGirl.create(:problem, subcategory_id: category.subcategories.first.id.to_s)
        problem2 = FactoryGirl.create(:problem, subcategory_id: category.subcategories.first.id.to_s)

        get :show, category_id: category.id.to_s, subcategory_id: category.subcategories.first.id.to_s, id: problem1.id.to_s
      end
      let(:body) { JSON.parse(response.body)}
      it "returns http 200" do
        response.response_code.should == 200
      end

    end
  end

end
