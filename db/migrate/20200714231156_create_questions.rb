# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :tag
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
