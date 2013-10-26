class Category
  include Mongoid::Document

  field :title, type: String
  field :image, type: String

  embeds_many :subcategories
end
