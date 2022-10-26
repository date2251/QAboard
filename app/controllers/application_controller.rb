class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_user_logged_in
    redirect_to login_path unless logged_in?
  end

  def counts_gooded(user)
    num = 0
    answers = user.answers
    answers.each do |answer|
      num += Good.where(answer_id: answer.id).count
    end
    num
  end
end
