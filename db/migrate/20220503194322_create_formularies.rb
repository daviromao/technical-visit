class CreateFormularies < ActiveRecord::Migration[6.1]
  def change
    create_table :formularies do |t|
      t.string :name, null: false, unique: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
