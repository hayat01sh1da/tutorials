# frozen_string_literal: true

# Creates the interviews table that belongs_to users.
class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :datetime
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :interviews, %i[user_id created_at]
  end
end
