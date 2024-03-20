AppConfig = YAML.load_file("#{Rails.root}/config/settings.yml", aliases: true)[Rails.env].symbolize_keys
