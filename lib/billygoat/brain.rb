module Billy

  class Brain

    include Disk
    include Config
    include Settings
    include Knowledge
    include Credentials
    include Skills

    attr_accessor :skill

    #
    # Short term memory serving as a workspace
    # for executing tasks
    #
    def memory
      return @memory if @memory
      @memory = Memory.new
      @memory.brain = self
      @memory.credentials = credentials
      @memory.skills = skills
      @memory
    end

    #
    # Clear the workspace for executing tasks
    #
    def forget
      @memory = nil
    end

    #
    # Recall a skill and place it in memory
    #
    def recall(name)
      self.skill = find_skill(name)
      return unless skill

      require skill.internal_location if skill.internal_location
      memory.extend(skill.module)
    end

    #
    # Execute a task in memory
    #
    def execute(*args)
      assert_skill_loaded

      if args.empty? || !skill.has_a_task?(args.first)
        args.unshift skill.default_task.name
      end

      memory.send *args
    end

    private

      def assert_skill_loaded
        fail "Naaaa! Unknown skill" unless skill
      end

  end

end