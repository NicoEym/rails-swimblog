class Post < ApplicationRecord
  belongs_to :user

  has_one :content
  has_one :title
  has_one :event_date
end
