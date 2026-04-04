// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "./channels"
import "bootstrap"

Rails.start()
ActiveStorage.start()
