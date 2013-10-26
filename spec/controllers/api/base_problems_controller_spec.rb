require 'spec_helper'

describe Api::BaseProblemsController do

  context 'show all' do
    describe 'GET #index' do
      before do
        FactoryGirl.create(:problem)
        get :index
      end
      let(:body) { JSON.parse(response.body)}
      it "returns http 200" do
        response.response_code.should == 200
      end

      it "response object should be array" do
        body.kind_of?(Array).should be_true
      end
    end
  end

  context 'show one' do
    before do
        @problem = FactoryGirl.create(:problem)
        get :show, id: @problem.id.to_s
      end
      let(:body) { JSON.parse(response.body)}
      it "returns http 200" do
        response.response_code.should == 200
      end

      it "response object should contains title" do
        body.should have_key 'title'
      end
      it "response object should contains status" do
        body.should have_key 'status'
      end
      it "response object should contains address" do
        body.should have_key 'address'
      end
      it "response object should contains description" do
        body.should have_key 'description'
      end
      it "response object should contains location.lat" do
        body['location'].should have_key 'lat'
      end
      it "response object should contains location.lng" do
        body['location'].should have_key 'lng'
      end
  end
end
