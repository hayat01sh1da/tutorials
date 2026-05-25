# frozen_string_literal: true
# rbs_inline: enabled

# An API user account with a bcrypt password and many todos.
class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
