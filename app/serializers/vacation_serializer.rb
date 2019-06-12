class VacationSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :budget, :number_of_travelers, :notes, :open_to_bids, :bucket_list_item_id
  has_many :attractions
end


