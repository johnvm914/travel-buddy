class Trip < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates :destination, :begin_date, :end_date, :budget, :description, :wish_list, presence: true
  validates :budget, numericality: true

  def not_favorited_by(id)
    not_favorited = true
    favorites.each do |favorite|
      if favorite.user_id == id
        not_favorited = false
      end
    end
    return not_favorited
  end

end
