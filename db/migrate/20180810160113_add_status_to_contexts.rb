class AddStatusToContexts < ActiveRecord::Migration[5.2]
  def change
    add_column :contexts, :status, :integer, default: 0
  end
end
