class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.text :body
      t.datetime :start_time
      t.timestamps
    end
  end
end
