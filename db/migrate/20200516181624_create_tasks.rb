class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :boxqty
      t.timestamp :created
      t.datetime :deliveryslot
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
