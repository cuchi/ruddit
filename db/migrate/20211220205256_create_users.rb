# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name, null: false, index: { unique: true }
      t.boolean :moderator, default: false, null: false

      t.timestamps
    end

    change_table :posts do |t|
      t.belongs_to :user, foreign_key: true, null: false
    end
  end
end
