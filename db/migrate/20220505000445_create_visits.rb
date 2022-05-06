class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.date :visit_date, null: false
      t.string :status, null: false
      t.references :user, null: false, foreign_key: true
      t.datetime :checkin_at
      t.datetime :checkout_at

      t.timestamps
    end
  end
end
