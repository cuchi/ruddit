# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.references :voteable, polymorphic: true

      t.boolean :upvote, default: true, null: false

      t.timestamps
    end

    add_index(:votes, %i[user_id voteable_id], unique: true)
  end
end
