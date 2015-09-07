class Pin < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true,
            length: {maximum: 30}
  validates :description, presence: true
end
