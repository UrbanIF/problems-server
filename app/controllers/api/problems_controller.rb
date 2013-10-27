class Api::ProblemsController < Api::BaseController

  def index
    serialized_problems = []
    response = format_response
    Problem.where(subcategory_id:response[:subcategory][:id]).each do |problem|
      serialized_problems << ProblemSerializer.new(problem)
    end
    response[:subcategory][:problems] = serialized_problems
    respond_with response
  end

  def show
    response = format_response
    response[:subcategory][:problem] = ProblemSerializer.new(
        Problem.where(subcategory_id:response[:subcategory][:id], id: params[:id]).first
      )
    respond_with response
  end

  def create
    problem = Problem.new(problem_params)
    problem.subcategory_id = check_subcategorty
    problem.save!
    render json: problem, status: 201
  end

  protected
    def check_subcategorty
      category = Category.find(params[:category_id])
      subcategory = category.subcategories.find(params[:subcategory_id])

      subcategory.id.to_s
    end

    def format_response
      category = Category.find(params[:category_id])
      subcategory = category.subcategories.find(params[:subcategory_id])

      response = {
        id: category.id.to_s,
        title: category.title,
        image: category.image,
        subcategory: {
          id: subcategory.id.to_s,
          title: subcategory.title,
        }
      }

      response
    end

    def problem_params
      params.permit(:title, :subcategory_id, :address, :description, location: [:lng, :lat])
    end
end
