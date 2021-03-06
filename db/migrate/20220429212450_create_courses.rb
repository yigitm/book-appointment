# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
