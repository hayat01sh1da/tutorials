# frozen_string_literal: true
# rbs_inline: enabled

# @rbs inherits ActiveModel::Serializer[Todo]
class TodoSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :user_id, :created_at, :updated_at
  # model association
  has_many :items
end
