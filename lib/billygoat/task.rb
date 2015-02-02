module Billy

  class Task

    attr_accessor :skill

    def initialize(config = {})
      config.each { |k,v| public_send("#{k}=",v) }
    end

    def name
      @name
    end

    def name=(value)
      @name = value.to_s.downcase
    end

    def to_s
      name
    end

    def method
      require skill.internal_location if skill.internal_location
      skill.module.instance_method(name)
    end

    def source
      self.method.source_location
    end

  end

end