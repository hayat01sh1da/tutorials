# frozen_string_literal: true

# Replaces the legacy created_by string column with a user_id foreign key.
class AddForeignKeyToTodos < ActiveRecord::Migration[6.0]
  def up
    remove_column :todos, :created_by, :string
    add_reference :todos, :user, foreign_key: true
    change_column_null :todos, :user_id, false
  end

  def down
    remove_reference :todos, :user, foreign_key: true
    add_column :todos, :created_by, :string
  end
end
