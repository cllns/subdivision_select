module SubdivisionSelect
  class Engine < ::Rails::Engine
    isolate_namespace SubdivisionSelect

    require "jquery-rails"
    # "country_select" requires "countries", but it's separated here because:
    #   - `countries` is used directly
    #   - `country_select` is so users don't have to add country_select to their
    #                      Gemfile, since it's required
    # (so we could have just included the latter, but this is more clear)
    require "countries"
    require "country_select"

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
