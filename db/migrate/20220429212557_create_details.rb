# frozen_string_literal: true

class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :course_name
      t.string :summary
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
