class CreateCitizenAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :citizen_addresses do |t|
      t.string :zip_code
      t.string :public_place
      t.string :complement
      t.string :district
      t.string :city
      t.string :federative_unit
      t.string :ibge
      t.references :citizen, foreign_key: true

      t.timestamps
    end
  end
end
