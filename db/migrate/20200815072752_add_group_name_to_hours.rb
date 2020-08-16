class AddGroupNameToHours < ActiveRecord::Migration[6.0]
  def change
    add_column :hours, :group_id, :integer
  end
end
