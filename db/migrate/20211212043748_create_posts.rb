class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title, :null => false
      t.text :body, :null => false

      t.timestamps
    end
  end
end
