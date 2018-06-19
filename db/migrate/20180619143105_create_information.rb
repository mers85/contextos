class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information_posts do |t|
      t.string :title
      t.text :summary
      t.string :url
      t.references :context, foreign_key: true

      t.timestamps
    end
  end
end
