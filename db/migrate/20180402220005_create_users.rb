class CreateUsers < ActiveRecord::Migration
  def change
    t.string :email, null: false
    t.string :password_digest, null: false

    t.timestamps null: false
  end
end
