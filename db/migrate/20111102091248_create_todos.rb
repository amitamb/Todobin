class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :complete, :default => false
      t.integer :hours
      t.datetime :scheduled_day

      t.timestamps
    end
  end
end
