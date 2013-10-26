class Api::ProblemsController < Api::BaseController

 def index
    respond_with Category.find(params[:category_id]).subcategories.find(params[:category_id])
  end

end
