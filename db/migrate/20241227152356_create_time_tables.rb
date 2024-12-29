class CreateTimeTables < ActiveRecord::Migration[7.0]
  def change
    create_table :time_tables do |t|
      t.references :task, null: false, foreign_key: true
      t.references :sprint, null: false, foreign_key: true
      t.text :description
      t.integer :planned_hour
      t.integer :planned_minute
      t.string :task_timing
      t.string :official_documentation
      t.string :video_link
      t.integer :day_type
      t.boolean :is_active

      t.timestamps
    end
  end
end
