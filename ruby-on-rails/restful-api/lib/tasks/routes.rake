namespace :routes do
  desc "Export all endpoints to docs/routes.md"
  task export: :environment do
    Rails.application.reload_routes!
    all_routes = Rails.application.routes.routes
    require 'action_dispatch/routing/inspector'
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    markdown = inspector.format(MarkdownFormatter.new)
    export('docs/routes.md', markdown)
  end

  private

  # https://github.com/rails/rails/blob/63f0c04850dd0bcdc7d35266e81fa1a7778570a8/actionpack/lib/action_dispatch/routing/inspector.rb#L64 のI/Fを踏襲

  class MarkdownFormatter

    attr_reader :sections, :current_section

    def initialize
      @sections = []
      @current_section = ''
    end

    def header(routes)
      sections << '|Prefix |Verb |URI Pattern |Controller#Action |'
      sections << '|:-|:-|:-|:-|'
    end

    def section(routes)
      routes.each { |route|
        sections << "|#{route[:name]} |#{route[:verb]} |#{route[:path]} |#{route[:reqs]} |"
      }
    end

    def result
      sections.join("\n")
    end

    def section_title(title)
      current_section = title
    end

    def no_routes
      sections << ''
    end
  end

  def export(filepath, markdown)
    File.open(filepath, 'w') { |f|
      f.puts "\#\# エンドポイント一覧\n\n" << markdown
    }
  end
end
