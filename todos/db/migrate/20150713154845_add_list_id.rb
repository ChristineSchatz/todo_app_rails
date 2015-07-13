class AddListId < ActiveRecord::Migration
  def change
    add_column :tasks, :list_id, :integer, null: false
  end
end
