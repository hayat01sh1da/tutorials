# frozen_string_literal: true
# rbs_inline: enabled

# Abstract base class for every ActiveRecord model in the app.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
