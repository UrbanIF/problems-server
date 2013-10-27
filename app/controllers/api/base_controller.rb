class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :default_json

  respond_to :json

  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found


  def not_found(data={})
    render json: data, status: 404
  end

  def default_json
    request.format = :json if params[:format].nil?
  end
end
