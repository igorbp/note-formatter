module Helpers
  module Configuration
    require 'yaml'

    def config
      @config || YAML.load_file('configs.yml')
    end

    # localization
    def l(key, language = "pt-BR")
      config["general"][language][key]
    end

    # markdown
    def m(key)
      config["general"]["markdown"][key]
    end

    # format
    def f(key, format)
      config[format][key]
    end
  end
end
