class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.integer :hospital_id
      t.string :name, null: false
      t.datetime :birthday
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.string :mail, null: false
      t.string :disease, null: false

      t.timestamps
    end
  end
end
