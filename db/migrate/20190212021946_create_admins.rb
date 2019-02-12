class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token

      t.timestamps
    end
    add_index :admins, :session_token, unique: true
    add_index :admins, :username, unique: true
  end
end
