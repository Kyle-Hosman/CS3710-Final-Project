class Item < ApplicationRecord
  belongs_to :user

  # validates :name, presence: true
  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :description, presence: true
  # validates :availability, inclusion: { in: [true, false] }
end
