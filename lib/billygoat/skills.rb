module Billy

  module Skills

    def skills_dir
      @skill_dir ||= "skills"
    end
    attr_writer :skill_dir

    def skills_path
      "#{config_path}/#{skills_dir}/"
    end

    def system_skills_path(name=nil)
      File.expand_path("../../skills/#{name}", __FILE__)
    end

    def skills
      validate_knowledge
      knowledge[:skills].map{ |config| Skill.new(config) }
    end

    def find_skill(name)
      skills.detect{ |skill| skill.name.downcase == name.downcase }
    end

  end

end