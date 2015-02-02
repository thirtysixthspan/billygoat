module Billy

  #
  # Storage for all goat specific settings
  #
  module Settings

    def settings_file
      @settings ||= "settings.yml"
    end
    attr_writer :settings

    def settings_path
      "#{config_path}/#{settings_file}"
    end

    def default_settings
      {
        version: VERSION
      }
    end

    def settings
      return @settings if @settings
      save_settings(default_settings) unless File.exists?(settings_path)
      @settings = YAML.load_file(settings_path)
    end

    def save_settings(settings = @settings)
      create_config_path
      save_yaml(settings_path, settings)
    end

  end

end
