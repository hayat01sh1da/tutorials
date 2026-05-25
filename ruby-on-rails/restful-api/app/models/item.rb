# frozen_string_literal: true
# rbs_inline: enabled

# A single todo-list item belonging to a Todo.
class Item < ApplicationRecord
  belongs_to :todo

  validates :name, presence: true
end
