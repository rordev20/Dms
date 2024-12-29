class CreateSubTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_tasks do |t|
      t.references :task, null: false, foreign_key: true
      t.references :sprint, null: false, foreign_key: true
      t.text :description
      t.integer :planned_hour, default: 0
      t.integer :planned_minute, default: 0
      t.string :task_timing
      t.integer :actual_hour, default: 0
      t.integer :actual_minute, default: 0
      t.string :official_documentation
      t.string :video_link
      t.datetime :activity_date, default: DateTime.now

      t.timestamps
    end
  end
end
