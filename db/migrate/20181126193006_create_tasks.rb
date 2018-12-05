class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :done, default: false
      t.datetime :deadline
      t.references :list, foreign_key: true
      t.timestamps
    end
    add_index  :tasks, [:list_id, :title], unique: true
  end
end
