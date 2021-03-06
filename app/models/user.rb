class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :attendings
  has_many :attended_events, through: :attendings, source: :event

  def f_name
    [self.first_name, self.last_name].join(' ')
  end
end
