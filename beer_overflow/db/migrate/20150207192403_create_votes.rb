class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer votable_id
      t.string votable_type
      t.references :user
      t.boolean :liked

      t.timestamps
    end
  end
end
