# frozen_string_literal: true
# rbs_inline: enabled

# A todo list owned by a User, composed of many Items.
class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
end
