# frozen_string_literal: true
# rbs_inline: enabled

# Helpers shared by every view, currently scoped to the Devise mapping lookup.
module ApplicationHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
