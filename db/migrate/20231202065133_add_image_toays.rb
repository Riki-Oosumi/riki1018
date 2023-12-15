class AddImageToays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :image, :string
  end
end
