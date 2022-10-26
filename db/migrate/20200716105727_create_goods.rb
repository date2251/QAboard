# frozen_string_literal: true

class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps

      t.index %i[user_id answer_id], unique: true
    end
  end
end
