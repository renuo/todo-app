class Todo < ApplicationRecord
  has_one :user
  validates :title, presence: true,
            length: { minimum: 2 }
end
