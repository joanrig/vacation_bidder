class CategoryAttraction < ApplicationRecord
  belongs_to :attraction
  belongs_to :category
end
