class Trip < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates :trip_type, :destination, :date_type, :begin_date, :end_date, :budget, :description, :wish_list, presence: true

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
