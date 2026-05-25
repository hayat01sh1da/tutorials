# frozen_string_literal: true

AppConfig = YAML.load_file(Rails.root.join('config/settings.yml').to_s, aliases: true)[Rails.env].symbolize_keys
