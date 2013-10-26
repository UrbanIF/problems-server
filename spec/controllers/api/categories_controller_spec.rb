require 'spec_helper'

describe Api::CategoriesController do
  context 'show all' do
    describe 'GET #index' do
      before do
        FactoryGirl.create(:category)
        get :index
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
