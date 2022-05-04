class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.string :question_type, null: false
      t.string :url_image
      t.references :formulary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
