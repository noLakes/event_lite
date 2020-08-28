class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :attendings
  has_many :attendees, through: :attendings, source: :user

  scope :past, -> { where("time < ?", DateTime.now) }
  scope :upcoming, -> { where("time > ?", DateTime.now) }

  def pretty_time
    self.time.to_formatted_s(:short)
  end
end
