# frozen_string_literal: true

# Adds profile columns (name, birthday, sex, school) to the users table.
class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.date :birthday
      t.integer :sex
      t.string :school
    end
  end
end
