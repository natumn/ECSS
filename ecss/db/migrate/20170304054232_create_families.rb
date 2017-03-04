class CreateFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :families do |t|
      t.integer :patient_id
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.string :mail, null: false

      t.timestamps
    end
  end
end
