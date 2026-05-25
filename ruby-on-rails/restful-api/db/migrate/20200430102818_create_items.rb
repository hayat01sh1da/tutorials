# frozen_string_literal: true

# Creates the items table belonging to a todo, with done? defaulting to false.
class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done, null: false, default: false
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
