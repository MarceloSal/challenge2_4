class CreateCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.date :birthday, null: false
      t.string :phone, null: false
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
