class AddUserIdToContexts < ActiveRecord::Migration[5.2]
  def change
    add_column :contexts, :user_id, :integer
  end
end
