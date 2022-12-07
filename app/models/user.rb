class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, 
         omniauth_providers: [:google_oauth2]

  enum role: [:user , :moderator , :admin]
  after_initialize :set_default_role, :if => :new_record?
    def set_default_role
      self.role ||= :user
    end

    #relationship
    has_many :foods
    has_many :comments

    def self.create_from_provider_data(provider_data)
      where(email: provider_data.info.email).first_or_create do |user|
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = provider_data.info.last_name
        user.provider = provider_data.provider
        user.uid = provider_data.uid
      end
    end
end
