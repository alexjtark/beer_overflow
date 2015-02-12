class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username # need constraint, is it ok for this to be NULL?
      t.string :password_digest# need constraint, is it ok for this to be NULL?
      t.string :email# need constraint, is it ok for this to be NULL?

      t.timestamps
    end
  end
end
