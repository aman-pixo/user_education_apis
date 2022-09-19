class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :course_name
      t.string :board
      t.string :percentage
      t.string :passing_year
      t.string :branch
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
