class AddHoursIdToGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :hour_id, :integer
    remove_column :groups, :group_id, :integer
  end
end
