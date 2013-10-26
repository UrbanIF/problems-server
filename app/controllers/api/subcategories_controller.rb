class Api::SubcategoriesController < Api::BaseController

  def index
    respond_with Category.find(params[:category_id])
  end
end
