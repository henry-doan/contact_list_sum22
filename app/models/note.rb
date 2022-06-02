class Note < ApplicationRecord
  belongs_to :contact
  has_many :comments, dependent: :destroy

  validates :body, presence: true 
end
