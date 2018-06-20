class AddCategoryIdToContexts < ActiveRecord::Migration[5.2]
  def change
    add_column :contexts, :category_id, :integer
  end
end
