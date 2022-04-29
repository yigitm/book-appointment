class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :courses, :name, :course_type
  end
end
