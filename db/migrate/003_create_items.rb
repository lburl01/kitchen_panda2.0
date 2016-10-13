class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :locations, table_name: :items do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true
      t.string :name
      t.integer :quantity
      t.boolean :is_deleted, null: false, default: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
