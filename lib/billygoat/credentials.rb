module Billy

  module Credentials

    def credentials_file
      @credentials_file ||= "credentials.yml"
    end
    attr_writer :credentials_file

    def credentials_path
      "#{config_path}/#{credentials_file}"
    end

    def credentials
      return @credentials if @credentials
      save_credentials({}) unless File.exists?(credentials_path)
      @credentials = YAML.load_file(credentials_path)
      @credentials.default_proc = ->(h,k) { h[k] = {} }
    end

    def save_credentials(credentials = @credentials)
      create_config_path
      save_yaml(credentials_path, credentials)
    end

  end

end
