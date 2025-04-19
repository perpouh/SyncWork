class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects, id: :string do |t|
      t.string :project_name
      t.string :description

      t.timestamps
    end
  end
end
