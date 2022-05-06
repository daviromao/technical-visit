class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.references :question, null: false, foreign_key: true
      t.references :visit, foreign_key: true
      t.datetime :answered_at
      t.datetime :updated_answer_at

      t.timestamps
    end
  end
end
