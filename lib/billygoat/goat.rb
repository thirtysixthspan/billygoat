module Billy

  class Goat

    def brain
      @brain ||= Brain.new
    end

    def execute(*args)
      args.shift if brain.recall(args.first)

      brain.execute(*args)
    end

  end

end
