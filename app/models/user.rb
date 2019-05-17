class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable
   has_many :bucket_list_items
   has_many :vacations, through: :bucket_list_items
   has_many :vacation_attractions, through: :vacations
   has_many :attractions, through: :vacation_attractions

   validates :first_name, presence: true
   validates :last_name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
            binding.pry
      user.first_name = auth.info.name.split.first
      user.last_name = auth.info.name.split.last
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
