class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :official_documentation
      t.string :video_link
      t.integer :total_hours
      t.integer :total_minutes
      t.boolean :is_active, default: 1

      t.timestamps
    end
  end
end
