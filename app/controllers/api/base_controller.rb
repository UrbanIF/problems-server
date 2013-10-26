class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :default_json

  respond_to :json

  def default_json
    request.format = :json if params[:format].nil?
  end
end
