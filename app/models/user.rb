class User < ApplicationRecord
	before_save { self.email.downcase! }
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
		self.goods.find_or_create_by(answer_id: answer.id)
	end

	def unlove(answer)
		good = self.goods.find_by(answer_id: answer.id)
		good.destroy if good
	end

	def loving?(answer)
		self.goodings.include?(answer)
	end

	has_many :favorites
	has_many :favoritings, through: :favorites, source: :question

	def favorite(question)
		self.favorites.find_or_create_by(question_id: question.id)
	end

	def unfavorite(question)
		favorite = self.favorites.find_by(question_id: question.id)
		favorite.destroy if favorite
	end

	def favoriting?(question)
		self.favoritings.include?(question)
	end
end
