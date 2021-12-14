class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.boolean :done
      t.text :name
      t.integer :order
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
