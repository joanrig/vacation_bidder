class BucketListItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :vacation_id, :notes
  belongs_to :vacation
  belongs_to :user

end
