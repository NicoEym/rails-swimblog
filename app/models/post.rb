class Post < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  belongs_to :user

  has_one :content
  has_one :title
  has_one :event_date
end
