module Billy

  module Disk

    def create_path(path)
      FileUtils.mkdir_p(path)
    end

    def save_yaml(file_path, object)
      File.open(file_path, 'w') { |file| file.write(object.to_yaml) }
    end

  end

end
