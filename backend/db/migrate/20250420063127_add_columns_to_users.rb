class AddColumnsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :screen_name, :string
    add_column :users, :username, :string
    add_column :users, :office_id, :integer
    add_column :users, :department_id, :integer
    add_index :users, :username, unique: true
  end
end
