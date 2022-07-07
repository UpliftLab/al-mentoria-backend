class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :photo
      t.string :name
      t.string :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
