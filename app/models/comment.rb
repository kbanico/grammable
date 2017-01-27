class Comment < ApplicationRecord
  belongs_to :gram
  belongs_to :user
  validates :message, length: { minimum: 2, maximum: 50 }, presence: true
end
