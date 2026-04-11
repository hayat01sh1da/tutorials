# rbs_inline: enabled
class Item < ApplicationRecord
  belongs_to :todo

  validates :name, presence: true
end
