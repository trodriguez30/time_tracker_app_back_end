class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :time
      t.boolean :is_running
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
