class Question < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  has_many :answers

  has_many :favorites
end
