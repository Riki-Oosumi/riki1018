class AddUserIdToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :user_id, :integer
  end
end
