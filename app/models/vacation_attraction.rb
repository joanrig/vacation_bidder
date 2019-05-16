class VacationAttraction < ApplicationRecord
  belongs_to :vacation
  belongs_to :attraction
end
