class CreateMentorTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :mentor_topics do |t|
      t.float :rating
      t.references :mentor, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
