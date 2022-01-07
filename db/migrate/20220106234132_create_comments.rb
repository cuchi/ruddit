# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false

      t.belongs_to :user, foreign_key: true, null: false
      t.references :parent, polymorphic: true

      t.timestamps
    end
  end
end
