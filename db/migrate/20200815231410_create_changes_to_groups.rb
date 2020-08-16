class CreateChangesToGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :group_name, :text
    end
end
