class CreateSprints < ActiveRecord::Migration[7.0]
  def change
    create_table :sprints do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active, default: 0

      t.timestamps
    end
  end
end
