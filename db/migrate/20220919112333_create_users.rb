class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :gender
      t.date :dob
      t.text :address
      t.timestamps
    end
  end
end
