class Category
  include Mongoid::Document

  field :title, type: String
  field :image, type: String

  embeds_many :subcategories

  accepts_nested_attributes_for :subcategories
end
