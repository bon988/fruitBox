class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :season
      t.string :category

      t.timestamps
    end
  end
end
