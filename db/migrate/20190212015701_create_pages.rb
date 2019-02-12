class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :description
      t.string :body
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
