class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.string :parent_type
      t.text :content
      t.integer :author_id

      t.timestamps
    end
  end
end
