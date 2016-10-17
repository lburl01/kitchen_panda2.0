class AddToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :id, :primary_key
  end
end
