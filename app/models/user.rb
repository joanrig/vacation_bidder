class User < ApplicationRecord
  #enum role: [:traveler, :bidder]
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable
   has_many :bucket_list_items
   has_many :vacations, through: :bucket_list_items
   has_many :vacation_attractions, through: :vacations

   has_many :user_attractions
   has_many :attractions, through: :user_attractions

   validates :first_name, presence: true
   validates :last_name, presence: true
   #validates :role, inclusion: { in: %w(Traveler Bidder Admin) } does not work - invalidates Traveler even tho perfect match

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name.split.first
      user.last_name = auth.info.name.split.last
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end


end
