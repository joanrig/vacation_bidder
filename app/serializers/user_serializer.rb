class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :attractions
  has_many :bucket_list_items
  has_many :vacations

end
