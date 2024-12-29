class CreatePunches < ActiveRecord::Migration[7.0]
  def change
    create_table :punches do |t|
      t.references :sub_task, null: false, foreign_key: true
      t.datetime :punch_in
      t.datetime :punch_out

      t.timestamps
    end
  end
end
