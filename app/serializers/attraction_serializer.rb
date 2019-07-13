class AttractionSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :city, :state, :county, :country, :notes, :public
  has_many :vacations
  has_many :categories
  has_many :users
end
