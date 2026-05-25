# frozen_string_literal: true

# Adds default values for users.name, users.sex, and interviews.status.
class AddDefaultValues < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :name, from: nil, to: '新規ユーザー'
    change_column_default :users, :sex, from: nil, to: 0
    change_column_default :interviews, :status, from: nil, to: 0
  end
end
