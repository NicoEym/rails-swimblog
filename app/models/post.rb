class Post < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  has_one_attached :photo
  belongs_to :user
  belongs_to :swim_type

  def clean_date
    "#{event_date.strftime('%B')}, #{event_date.day.ordinalize} #{event_date.year}"
  end
end
