class ApplicationController < ActionController::Base
	include SessionsHelper
	
	private

	def require_user_logged_in
		unless logged_in?
			redirect_to login_path
		end
	end

	def counts_gooded(user)
		num = 0
		answers = user.answers
		answers.each do |answer|
			num += Good.where(answer_id: answer.id).count
		end
		return num
	end
end
