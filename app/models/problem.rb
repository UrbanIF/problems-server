class Problem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  field :title, type: String
  field :subcategory_id, type: String
  field :status, type: String
  field :address, type: String
  field :description, type: String
  field :location, type: Point

  spatial_index :location
end
