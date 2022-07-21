class AddIndexTopicsOnLabel < ActiveRecord::Migration[7.0]
  def change
    add_index :topics, :label, unique: true
  end
end
