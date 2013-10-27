class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :address, :location, :description

  def id
    object.id.to_s
  end

  def location
    object.location.to_hsh(:lng, :lat).to_json
  end
end
