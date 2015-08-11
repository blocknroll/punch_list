class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :notes
      t.string :status, default: 'incomplete'
      t.date :start_date
      t.date :due_date

      t.timestamps null: false
    end
  end
end
