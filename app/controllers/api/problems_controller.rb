class Api::ProblemsController < Api::BaseController

  def index

    serialized_problems = []
    response = format_response
    Problem.where(subcategory_id:response[:subcategory][:id]).each do |problem|
      serialized_problems << ProblemSerializer.new(problem).to_json
    end
    response[:subcategory][:problems] = serialized_problems
    respond_with response
  end

  def show
    response = format_response
    response[:subcategory][:problem] = ProblemSerializer.new(
        Problem.where(subcategory_id:response[:subcategory][:id], id: params[:id]).first
      ).to_json
    respond_with response
  end

  protected
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
end
