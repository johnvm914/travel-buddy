class Trip < ApplicationRecord
  belongs_to :user
  validates :destination, :begin_date, :end_date, :budget, :description, :wish_list, presence: true
  validates :budget, numericality: true
end
