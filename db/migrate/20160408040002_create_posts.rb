class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :fullname
      t.string :address
      t.string :tel_number
      t.string :mob_number
      t.string :email

      t.timestamps null: false
    end
  end
end
