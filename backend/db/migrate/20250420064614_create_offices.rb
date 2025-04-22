class CreateOffices < ActiveRecord::Migration[7.2]
  def change
    create_table :offices do |t|
      t.string :office_name
      t.string :office_address
      t.integer :office_manager
      t.string :office_tel

      t.timestamps
    end
  end
end
