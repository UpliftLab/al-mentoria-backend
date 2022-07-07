class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :mentor_topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
