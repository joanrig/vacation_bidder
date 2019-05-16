class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
   has_many :bucket_list_items
   has_many :vacations, through: :bucket_list_items
   has_many :vacation_attractions, through: :vacations

   validates :first_name, presence: true
   validates :last_name, presence: true
end
