class CreateDepartments < ActiveRecord::Migration[7.2]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.integer :department_manager

      t.timestamps
    end
  end
end
