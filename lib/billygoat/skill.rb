module Billy

  class Skill

    ATTRIBUTES = [:name, :internal_location, :external_location]
    attr_accessor *ATTRIBUTES

    def initialize(config = {})
      config.each { |k,v| public_send("#{k}=",v) }
    end

    def to_s
      name
    end

    def to_h
      ATTRIBUTES.each_with_object({}) do |attribute, hash|
        hash[attribute] = public_send(attribute)
      end
    end

    def module
      module_from_string(name)
    end

    def tasks
      return @tasks if @tasks
      require internal_location if internal_location
      methods = self.module.instance_methods - Object.new.methods
      @tasks = methods.map { |method| Task.new(name: method, skill: self) }
    end

    def default_task
      tasks.first
    end

    def has_a_task?(name)
      !!find_task(name)
    end

    def find_task(name)
      tasks.detect{ |task| task.name.to_s.downcase == name.to_s.downcase }
    end

    def documentation?
      !!has_a_task?(:documentation)
    end

    def documentation(*args)
      execute_task(:documentation, self, *args)
    end

    def execute_task(name, *args)
      m = Module.new
      require internal_location
      m.extend(self.module)
      m.send(name, *args)
    end

    private

      def module_from_string(str)
        str.split('::').inject(Object) do |mod, module_name|
          mod.const_get(module_name)
        end
      end

  end

end