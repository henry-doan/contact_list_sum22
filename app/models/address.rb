class Address < ApplicationRecord
  belongs_to :contact

  validates :street, :zip, :state, :city, presence: true 
  validates :zip, numericality: { only_integer: true }
end
