module Billy

  module Knowledge

    def knowledge_file
      @knowledge_file ||= "knowledge.yml"
    end
    attr_writer :knowledge_file

    def knowledge_path
      "#{config_path}/#{knowledge_file}"
    end

    def knowledge
      return @knowledge if @knowledge
      save_knowledge(default_knowledge) unless File.exists?(knowledge_path)
      @knowledge = YAML.load_file(knowledge_path)
    end

    def update_knowledge
      knowledge[:skills] = skill_set
        .skills
        .reject{ |skill| autoloaded_skills.map{|s| s[:name]}.include? skill.name }
        .uniq{ |skill| skill.name }
        .map(&:to_h)
    end

    def default_knowledge
      {
        skills: [
          {
            name: 'Learn',
            internal_location: system_skills_path("learn.rb")
          },
          {
            name: 'Show',
            internal_location: system_skills_path("show.rb")
          },
          {
            name: 'Update',
            internal_location: system_skills_path("update.rb")
          },
          {
            name: 'Help',
            internal_location: system_skills_path("help.rb")
          },
          {
            name: 'Git',
            internal_location: system_skills_path("git.rb")
          },
          {
            name: 'Document',
            internal_location: system_skills_path("document.rb")
          }
        ]
      }
    end

    def validate_knowledge
      return if knowledge &&
        knowledge.is_a?(Hash) &&
        knowledge.include?(:skills)
      fail "Naaa! Broken knowledge file."
    end

    def save_knowledge(knowledge = @knowledge)
      create_config_path
      save_yaml(knowledge_path, knowledge)
    end

  end

end
