class AddHoursIdToGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :group_id, :integer
  end
end
