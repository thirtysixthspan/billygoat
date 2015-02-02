module Billy

  module Config

    def root
      @root ||= ENV['HOME']
    end
    attr_writer :root

    def config_dir
      @config_dir ||= ".goat"
    end
    attr_writer :config_dir

    def config_path
      "#{root}/#{config_dir}"
    end

    def create_config_path
      create_path(config_path)
    end

    #
    # Save all in-memory configuration to disk
    #
    def save_configuration
      save_settings
      update_knowledge
      save_knowledge
      save_credentials
    end

  end

end
