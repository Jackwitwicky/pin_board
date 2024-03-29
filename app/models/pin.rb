class Pin < ActiveRecord::Base
  acts_as_votable

  has_attached_file :image, styles: {medium: "300x300"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  validates :title, presence: true,
            length: {maximum: 30}
  validates :description, presence: true
end
