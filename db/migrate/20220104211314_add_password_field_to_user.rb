class AddPasswordFieldToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.text :password_digest, null: false
    end
  end
end
