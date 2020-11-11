class Post < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  has_one_attached :photo
  belongs_to :user

end
