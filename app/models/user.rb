# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :questions

  has_many :answers

  has_many :goods
  has_many :goodings, through: :goods, source: :answer

  def love(answer)
    goods.find_or_create_by(answer_id: answer.id)
  end

  def unlove(answer)
    good = goods.find_by(answer_id: answer.id)
    good&.destroy
  end

  def loving?(answer)
    goodings.include?(answer)
  end

  has_many :favorites
  has_many :favoritings, through: :favorites, source: :question

  def favorite(question)
    favorites.find_or_create_by(question_id: question.id)
  end

  def unfavorite(question)
    favorite = favorites.find_by(question_id: question.id)
    favorite&.destroy
  end

  def favoriting?(question)
    favoritings.include?(question)
  end
end
