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

  context 'create' do
    describe 'POST #create' do
      before do
        category = FactoryGirl.create(:category)
        problem = FactoryGirl.build(:problem)
        params = {title: problem.title,
                  address: problem.address,
                  description: problem.description,
                  location: problem.location.to_hsh(:lng, :lat),
                  category_id: category.id.to_s,
                  subcategory_id: category.subcategories.first.id.to_s
                }
        post :create, params
      end
      it "returns http 201" do
        response.response_code.should == 201
      end
    end

    describe 'POST #create to non existing subcategory' do
      before do
        problem = FactoryGirl.build(:problem)
        params = {title: problem.title,
                  address: problem.address,
                  description: problem.description,
                  location: problem.location.to_hsh(:lng, :lat),
                   category_id: 'non existing',
                    subcategory_id: 'non existing'
                }
        post :create, params
      end
      it "returns http 404" do
        response.response_code.should == 404
      end
    end
  end

end
