class CreateCellphones < ActiveRecord::Migration[5.0]
  def change
    create_table :cellphones do |t|
      t.string :name, null: false
      t.float :price, default: 0.0
      t.integer :stars
      t.string :operating_system
      t.float :display_size
      t.string :picture_url, null: false
      t.string :maker

      t.timestamps
    end
  end
end
