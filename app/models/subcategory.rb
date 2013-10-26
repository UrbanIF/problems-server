class Subcategory
  include Mongoid::Document
  field :title, type: String

  embedded_in :category
end
