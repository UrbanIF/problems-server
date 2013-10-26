class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :image
  has_many :subcategories, embed: :objects
  def id
    object.id.to_s
  end

end
