class Pin < ActiveRecord::Base

  validates :title, presence: true,
            length: {maximum: 30}
  validates :description, presence: true
end
