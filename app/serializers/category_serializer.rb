class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  #has_many :users
  has_many :attractions
end
