class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.integer :user_id, index: true
      t.integer :context_id, index: true

      t.timestamps
    end
  end
end
