class Api::BaseProblemsController < Api::BaseController
  def index
    @posts = Problem.all
    @posts.limit(params[:limit]) if params[:limit]
    respond_with @posts
  end

  def show
    respond_with Problem.find(params[:id])
  end
end
