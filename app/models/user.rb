class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :conference_rooms, :through => :bookings
  has_and_belongs_to_many :roles

  def full_name
    return "#{first_name} #{last_name}".strip if(first_name || last_name)
    "Unknown"
  end

  def has_role?(role_sym)
      roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  after_create :welcome_send

  def welcome_send
   WelcomeMailer.welcome_send(self).deliver
  end
end
