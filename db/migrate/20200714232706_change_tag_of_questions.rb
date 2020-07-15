class ChangeTagOfQuestions < ActiveRecord::Migration[6.0]
  def change
		change_column :questions, :tag, :string, default: 'その他'
  end
end
