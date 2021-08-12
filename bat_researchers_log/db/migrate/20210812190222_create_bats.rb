class CreateBats < ActiveRecord::Migration[5.2]
  def change
    create_table :bats do |t|
      t.string :identification
      t.string :nickname
      t.string :species
      t.datetime :date_found
      t.string :location
      t.datetime :date_last_seen
      t.integer :weight
      t.integer :wing_span
      t.string :conservation_status
      t.boolean :white_nose_syndrome
      t.string :notes
      t.integer :user_id
      t.timestamps null: false
  end
end
