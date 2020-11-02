class CreateHours < ActiveRecord::Migration[6.0]
  def change
    create_table :hours do |t|
      t.text :name
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
