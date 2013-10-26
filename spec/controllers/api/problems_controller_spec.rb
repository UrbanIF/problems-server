require 'spec_helper'

describe Api::ProblemsController do

 context 'show all' do
    describe 'GET #index' do
      before do
        category = FactoryGirl.create(:category)
        get :index, category_id: category.id.to_s, subcategory_id: category.subcategories.first.id.to_s
      end
      let(:body) { JSON.parse(response.body)}
      it "returns http 200" do
        response.response_code.should == 200
      end

      it "response object should be array" do
        p body
        body.kind_of?(Array).should be_true
      end
    end
  end

end
