# frozen_string_literal: true

# Adds default values for users.name, users.sex, and interviews.status.
class AddDefaultValues < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :name, '新規ユーザー'
    change_column_default :users, :sex, 0
    change_column_default :interviews, :status, 0
  end
end
