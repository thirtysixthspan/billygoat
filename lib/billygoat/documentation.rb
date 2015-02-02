module Billy

  class Documentation

    #
    # Documentation includes the method definition and any
    # commented lines preceding the method definition
    #

    attr_accessor :method
    attr_writer :owner
    attr_accessor :mode

    def initialize(args)
      args.each { |k,v| public_send("#{k}=",v) }
    end

    def inspect
      return unless file_name && line_number
      case mode
      when :markdown
        build_markdown
      else
        build
      end
    end

    def inspect_markdown
      return unless file_name && line_number
      build_markdown
    end

    def file_name
      @file_name ||= self.method.source_location.first
    end

    def line_number
      @line_number ||= self.method.source_location.last
    end

    def parameters
      @parameters ||= self.method.parameters
    end

    def owner
      @owner ||= self.method.owner.name.downcase
    end

    def name
      @name ||= self.method.name.downcase
    end

    def required_parameters
      parameters
        .select{ |pair| pair.first == :req }
        .map{ |pair| pair.last}
    end

    def optional_parameters
      parameters
        .select{ |pair| pair.first == :opt }
        .map{ |pair| pair.last}
    end

    def variable_parameters
      parameters
        .select{ |pair| pair.first == :rest }
        .map{ |pair| pair.last}
    end

    def block_parameters
      parameters
        .select{ |pair| pair.first == :block }
        .map{ |pair| pair.last}
    end

    def source_file
      File.read(file_name)
    end

    def source
      source_file.split("\n")
    end

    def range
      head = tail = line_number - 1
      tail.downto(0).each do
        break unless source[head-1].match(/^\s*#/)
        head -= 1
      end
      (head..tail)
    end

    def unindent
      ->(line) { line.gsub(/^\s*/, '') }
    end

    def lines
      source[range].map(&unindent)
    end

    def build
      doc = lines
      doc[-1] = "goat #{owner} #{name} "
      required_parameters.each do |parameter|
        doc[-1] << "[#{parameter}] "
      end
      optional_parameters.each do |parameter|
        doc[-1] << "(#{parameter}) "
      end
      variable_parameters.each do |parameter|
        doc[-1] << "(*#{parameter}) "
      end
      block_parameters.each do |parameter|
        doc[-1] << "{&#{parameter}} "
      end
      doc << "\n"
      doc
    end

    def build_markdown
      doc = build
      doc.pop
      doc.map! { |line| line.match(/^\s*#/) ? "    #{line}" : line }
      doc.unshift "### #{doc.pop}"
      doc << "\n"
      doc.map! { |line| line.gsub(/(\[)/,'\[').gsub(/(\])/,'\]') }
      doc
    end

  end

end